Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :posts



  get 'static_pages/home'
  get 'static_pages/contact'
  get 'static_pages/help'
  get  'static_pages/about'

  get 'users/new'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
