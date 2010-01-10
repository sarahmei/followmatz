class StatusUpdatesController < ApplicationController
  # GET /status_updates
  # GET /status_updates.xml
  def index
    @status_updates = StatusUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @status_updates }
    end
  end

  # GET /status_updates/1
  # GET /status_updates/1.xml
  def show
    @status_update = StatusUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status_update }
    end
  end

  # GET /status_updates/1/edit
  def edit
    @status_update = StatusUpdate.find(params[:id])
    render :partial => 'edit_translation'
  end

  # PUT /status_updates/1
  # PUT /status_updates/1.xml
  def update
    @status_update = StatusUpdate.find(params[:id])
    if @status_update.update_attributes(params[:status_update])
      flash[:notice] = 'Translation successfully updated.'
    end
    render :partial => 'view_translation', :locals => {:status_update => @status_update}
  end

end
