class RubyistsController < ApplicationController
  # GET /rubyists
  # GET /rubyists.xml
  def index
    @rubyists = Rubyist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rubyists }
    end
  end

  # GET /rubyists/1
  # GET /rubyists/1.xml
  def show
    @rubyist = Rubyist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rubyist }
    end
  end

end
