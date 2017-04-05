Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
  	root 'tasks#index', as: :authenticated_root
  end

  root 'pages#home'
  get '/about', to: 'pages#about'

  resources :tasks do
  	member do
  		put :change
  	end
  end
end
