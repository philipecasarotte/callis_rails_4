Rails.application.routes.draw do

  # scope :admin do
  #   resource :user_session
  #   resources :pages, :as => :paginas, :collection=>{ :reorder=>:get, :order=>:post }
  #   resources :departments, :as => :departamentos
  #   resources :users, :as => :aniversariantes
  #   resources :events, :as => :eventos
  #   resources :procedures, :as => :procedimentos, :collection=>{ :reorder=>:get, :order=>:post }
  # end
  
  get "pages" "/paginas/:action", :controller => "pages"
  get "search" "/procedimentos/busca", :controller => "procedures", :action => "search"
  get "login_or_logout" "/autenticar", :controller => "user_sessions", :action => "check_status"
  get "/login", :controller => "user_sessions", :action => "new"
  get "logout" "logout", :controller => "user_sessions", :action => "destroy"
  resource :user_session
  resources :pages
  resources :users
  resources :events, :collection => { :arquivo => :get } 
  resources :procedures, :collection => { :search => :get }
  
  root :controller => "pages", :action => "index"
end

