ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  map.resources :status_updates, :only => [ :edit, :update ]
  map.resources :rubyists, :only => [:index, :show ]

  map.edit_notes 'edit_notes', :controller => 'status_updates', :action => 'edit_notes'
  map.update_notes 'update_notes', :controller => 'status_updates', :action => 'update_notes'
  map.add_vote 'add_vote', :controller => 'status_updates', :action => 'add_vote'

  map.root :controller => "rubyists", :action => "show", :id => 1

end
