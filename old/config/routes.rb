Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get 'comments/index'
  get 'comments/create'
  get 'comments/show'
  delete '/comments', to: 'comments#destroy'

  get 'posts/index'
  get 'tags/:tag', to: 'posts#index', as: "tag"
  get 'posts/create'
  delete '/posts',  to: 'posts#destroy'
  get 'posts/newpost'

  get 'partials/signin'
  get 'partials/signout'

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


  get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'json' }

  resources :comments
  resources :posts do
    resources :comments
  end
  resources :users
  resources :posts
  resources :posts, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
