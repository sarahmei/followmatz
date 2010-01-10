namespace :twitter do
  desc "Retrieve new updates from the rubyists in the system"
  task :update => :environment do
    require 'rubygems'
    require 'rtranslate'
    require 'twitter'

    Rubyist.all.each do |rubyist|
      puts "Getting updates for #{rubyist.twitter_name}..."
      existing_tweet_ids = rubyist.status_updates.map {|u| u.twitter_id }
      Twitter::Search.new.from(rubyist.twitter_name).each do |tweet|
        unless existing_tweet_ids.include?(tweet.id)
          rubyist.status_updates << StatusUpdate.new(:twitter_id => tweet.id, :original_text => tweet.text, 
            :translated_text => Translate.t(tweet.text, "JAPANESE", "ENGLISH"))
          rubyist.save!
          puts "  Found new tweet: #{tweet.text}"
          puts "    #{rubyist.twitter_name} now has #{rubyist.status_updates.length} updates in the system."
        end  
      end
    end
  end
end


