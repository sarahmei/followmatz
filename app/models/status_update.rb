class StatusUpdate < ActiveRecord::Base
  belongs_to :rubyist
  has_paper_trail
end
