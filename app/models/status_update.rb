class StatusUpdate < ActiveRecord::Base
  belongs_to :rubyist
  has_paper_trail

  def translation_history
    
  end

  def notes_history
 
  end
end
