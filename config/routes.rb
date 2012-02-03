CargoWiki::Engine.routes.draw do
  match '/article/preview', :to => 'articles#preview', :method => :post, :as => :preview_article

  resources :tags, :only => :index do
    resources :articles
  end

  resources :versions, :only => :index
  resources :users

  resources :articles do
    resources :versions, :only => [:index, :show]
    post :publish, :on => :member
  end

  resources :sessions
  match 'login', :to => 'sessions#new', :as => 'login'
  match 'logout', :to => 'sessions#destroy', :as => 'logout', :method => :delete
  root :to => 'tags#index'
end
