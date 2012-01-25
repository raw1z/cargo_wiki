Cargo::Engine.routes.draw do
  resources :versions, :only => :index
  resources :users

  resources :articles do
    resources :versions, :only => :index
  end

  resources :sessions
  match 'login', :to => 'sessions#new', :as => 'login'
  match 'logout', :to => 'sessions#destroy', :as => 'logout', :method => :delete
  root :to => 'articles#index'
end
