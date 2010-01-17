class StatusUpdate < ActiveRecord::Base
  belongs_to :rubyist
  has_paper_trail
  acts_as_voteable

  def translation_history
    
  end

  def notes_history
 
  end
end
