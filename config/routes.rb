ActionController::Routing::Routes.draw do |map|
  map.resource :user

  map.resource :session
  map.root :controller => 'interviews', :action => 'index'
  map.resources :interviews, :has_many => :responses
  
end