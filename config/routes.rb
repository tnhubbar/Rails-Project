Rails.application.routes.draw do
  
  resources :users
  resources :routines
  
  resources :categories do 
    resources :routines 
  end 

  resources :exercises
  root 'application#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
