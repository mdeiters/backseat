ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'interviews', :action => 'index'
  map.particpate '/:interview_id/participate', :controller => 'responses', :action => 'create'
  
  map.resource :user, :session
  map.resources :interviews, :has_many => :responses 
end