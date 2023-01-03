Rails.application.routes.draw do
  root to: redirect('home')
  get '/', to: redirect('home')
  get "/home", to: "main_pages#home"


  get "/signup", to: "users#new"
  resources :users # why does signup form break when i delete this???
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#delete'

  #recipes
  resources :recipes
  resources :comments
  resources :ratings
  
end
