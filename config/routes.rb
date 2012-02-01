CargoWiki::Engine.routes.draw do
  resources :tags, :only => :index do
    resources :articles
  end

  resources :versions, :only => :index
  resources :users

  resources :articles do
    resources :versions, :only => [:index, :show]
  end

  resources :sessions
  match 'login', :to => 'sessions#new', :as => 'login'
  match 'logout', :to => 'sessions#destroy', :as => 'logout', :method => :delete
  root :to => 'tags#index'
end
