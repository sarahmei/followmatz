Factory.define :status_update do |update|
  update.rubyist { Factory(:rubyist) }
  update.original_text { Factory.next(:update) }
  update.translated_text { Factory.next(:update) }
  update.twitter_id { Factory.next(:twitter_id) }
  update.twitter_date { Time.now }
end

Factory.sequence :update do |n|
  "This is less than 140 characters! #{n}"
end

Factory.sequence :twitter_id do |n|
  "#{n}"
end
