class RubyistsController < ApplicationController

  def index
    @rubyists = Rubyist.all
  end

  def show
    @rubyist = Rubyist.find(params[:id])
    @updates = StatusUpdate.paginate(:page => params[:page], :per_page => 10, :conditions => ["rubyist_id = ?", @rubyist.id], :order => "twitter_date DESC")
  end

end
