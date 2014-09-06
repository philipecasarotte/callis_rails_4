Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  get "/pages" "/paginas/:action", :controller => "pages"
  get "/procedimentos/busca", :controller => "procedures", :action => "search"
  get "/login_or_logout", :controller => "user_sessions", :action => "check_status"
  get "/login", :controller => "user_sessions", :action => "new"
  get "/logout", :controller => "user_sessions", :action => "destroy"
  resource :user_session
  resources :pages
  resources :users
  get "/events/past", :controller => "events", :action => "past" 
  resources :events
  resources :procedures, :collection => { :search => :get }
  
  root :controller => "pages", :action => "index"
end

