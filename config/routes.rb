Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"
  get '/signup' => 'users#new'
  resources :users
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'
  get '/pairs' => 'pairs#new'
  post 'pairs' => 'pairs#create'
  get '/pairs/:user_id' => 'pairs#show'
  delete '/pairs/:id' => 'pairs#delete'
  get '/message' => 'messages#new'
  post 'message' => 'messages#create'
  resources :messages
  get '/resume' => 'resumes#new'
  post 'resume' => 'resumes#create'
  patch 'resume.:id' => 'resumes#update'
  get '/resume/:id/edit' => 'resumes#edit'
  put '/resume/:id' => 'resumes#update'
  resources :resumes
  get '/contact' => 'contacts#index'
  get '/hub/:id' => 'hubs#show'

end
