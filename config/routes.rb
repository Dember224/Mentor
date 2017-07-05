Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  get '/signup' => 'users#new'
  resources :users
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/pairs' => 'pairs#new'
  post 'pairs' => 'pairs#create'
  get '/message' => 'message#new'
  get 'message' => 'message#create'

end
