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

  # GET /rubyists/new
  # GET /rubyists/new.xml
  def new
    @rubyist = Rubyist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rubyist }
    end
  end

  # GET /rubyists/1/edit
  def edit
    @rubyist = Rubyist.find(params[:id])
  end

  # POST /rubyists
  # POST /rubyists.xml
  def create
    @rubyist = Rubyist.new(params[:rubyist])

    respond_to do |format|
      if @rubyist.save
        flash[:notice] = 'Rubyist was successfully created.'
        format.html { redirect_to(@rubyist) }
        format.xml  { render :xml => @rubyist, :status => :created, :location => @rubyist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rubyist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rubyists/1
  # PUT /rubyists/1.xml
  def update
    @rubyist = Rubyist.find(params[:id])

    respond_to do |format|
      if @rubyist.update_attributes(params[:rubyist])
        flash[:notice] = 'Rubyist was successfully updated.'
        format.html { redirect_to(@rubyist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rubyist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rubyists/1
  # DELETE /rubyists/1.xml
  def destroy
    @rubyist = Rubyist.find(params[:id])
    @rubyist.destroy

    respond_to do |format|
      format.html { redirect_to(rubyists_url) }
      format.xml  { head :ok }
    end
  end
end
