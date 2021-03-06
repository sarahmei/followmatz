class StatusUpdatesController < ApplicationController
  before_filter :get_update, :only => [:edit, :edit_notes, :update, :update_notes, :add_vote]

  def edit
    render :partial => 'edit_translation'
  end

  def edit_notes
    note_rows = @status_update.translation_notes.split(/$/).length rescue 0
    @textarea_rows = [note_rows + 1, 3].max
    render :partial => 'edit_notes'
  end

  def update
    if @status_update.update_attributes(params[:status_update])
      flash[:notice] = 'Translation successfully updated.'
    end
    render :partial => 'view_translation', :locals => {:status_update => @status_update}
  end

  def update_notes
    if @status_update.update_attributes(params[:status_update])
      flash[:notice] = 'Notes successfully updated.'
    end
    render :partial => 'view_notes', :locals => {:status_update => @status_update}
  end

  def add_vote
    @status_update.votes.build(:vote => true)
    @status_update.save
    render :partial => 'thumbs_up', :locals => {:status_update => @status_update, :enable_voting => false}
  end

  def interesting
    @updates = StatusUpdate.paginate(:all, :page => params[:page], :per_page => 10,
    :include => :votes, :conditions => ['votes.vote = ?', true]).sort do |a,b|
      b.votes.length <=> a.votes.length
    end
  end

  def ruby_related
    @updates = StatusUpdate.paginate(:all, :page => params[:page], :per_page => 10,
    :conditions => "original_text like '%Ruby%'",
    :order => "twitter_date DESC")
  end

  private

  def get_update
    @status_update = StatusUpdate.find(params[:id])
  end

end
