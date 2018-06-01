Rails.application.routes.draw do

  #devise_for :users

  #videos
  resources :videos
  
  #treinos
  get 'trainings', to: "trainings#index"
  post 'training', to: "trainings#create"
  delete 'training', to: "trainings#destroy"

  #sessions
  resources :sessions, only: [:create]

  delete "/sessions/:authentication_token", to: "sessions#destroy"


  resources :users

end
