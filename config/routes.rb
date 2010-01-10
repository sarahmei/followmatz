ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  map.resources :status_updates, :only => [ :edit, :update ]
  map.resources :rubyists, :only => [:index, :show ]

  map.root :controller => "rubyists", :action => "show", :id => 1

end
