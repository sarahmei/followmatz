namespace :twitter do
  desc "Adds a twitter user to the system"
  task :add => :environment do
    twitter_user = ENV['name']
    if twitter_user.blank?
      puts "USAGE: rake twitter:add_user name=sarahmei"
    elsif Rubyist.find_by_twitter_name(twitter_user)
      puts "Twitter user #{twitter_user} is already in the system."
    elsif Rubyist.new(:twitter_name => twitter_user).save!
      puts "Twitter user #{twitter_user} added to the system."
    end
  end

  desc "Retrieve new updates from the rubyists in the system"
  task :update => :environment do
    require 'rubygems'
    require 'rtranslate'
    require 'twitter'

    Rubyist.all.each do |rubyist|
      puts "Getting updates for #{rubyist.twitter_name}..."
      existing_tweet_ids = rubyist.status_updates.map {|u| u.twitter_id.to_i }
      Twitter::Search.new.from(rubyist.twitter_name).each do |tweet|
        unless existing_tweet_ids.include?(tweet.id)
          rubyist.status_updates << StatusUpdate.new(:twitter_id => tweet.id, :original_text => tweet.text, 
            :translated_text => Translate.t(tweet.text, "JAPANESE", "ENGLISH"), :pic_url => tweet.profile_image_url,
            :twitter_date => tweet.created_at)
          rubyist.save!
          puts "  Found new tweet: #{tweet.text}"
          puts "    #{rubyist.twitter_name} now has #{rubyist.status_updates.length} updates in the system."
        end  
      end
    end
  end
end


