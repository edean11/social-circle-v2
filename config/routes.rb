Rails.application.routes.draw do

  root 'user_sessions#new'

  resource :user_session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :casts, :only => :index, format: "json"
    resources :groups, :only => :index, format: "json"
    resources :comments, :only => :index, format: "json"
  end
  resources :casts, only: [:new, :create, :destroy] do
    resources :comments, :only => :index, format: "json"
  end
  resources :comments, only: [:new, :create, :destroy]
  resources :groups, only: [:new, :create, :destroy]
  resources :subscriptions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:show], format: "json"
  resources :casts, only: [:index,:show], format: "json"
  resources :comments, only: [:index], format: "json"
  resources :groups, :only => :index, format: "json" do
    resources :casts, :only => :index, format: "json"
  end

end
