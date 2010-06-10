Factory.define :rubyist do |rubyist|
  rubyist.twitter_name { Factory.next(:twitter_handle) }
end

Factory.sequence :twitter_handle do |n|
  "twitterist#{n}"
end
