class Rubyist < ActiveRecord::Base
  has_many :status_updates, :order => "twitter_date DESC"
end
