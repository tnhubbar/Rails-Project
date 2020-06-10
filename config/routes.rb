Rails.application.routes.draw do
  
  resources :users
  resources :routines
  
  resources :categories do 
    resources :routines 
  end 

  resources :routines do
    resources :exercises 
  end 

  resources :exercises
  root 'application#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fb_create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
