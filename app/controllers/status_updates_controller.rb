class StatusUpdatesController < ApplicationController

  # GET /status_updates/1/edit
  def edit
    @status_update = StatusUpdate.find(params[:id])
    render :partial => 'edit_translation'
  end

  def edit_notes
    @status_update = StatusUpdate.find(params[:id])
    note_rows = @status_update.translation_notes.split(/$/).length rescue 0
    @textarea_rows = [note_rows + 1, 3].max
    render :partial => 'edit_notes'
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

  def update_notes
    @status_update = StatusUpdate.find(params[:id])
    if @status_update.update_attributes(params[:status_update])
      flash[:notice] = 'Notes successfully updated.'
    end
    render :partial => 'view_notes', :locals => {:status_update => @status_update}
  end

end
