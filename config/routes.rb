Rails.application.routes.draw do

  devise_for :users
  #usuarios
	get 'usernames', to: "users#names"

  #videos
  resources :videos
  
  #treinos
  get 'trainings', to: "trainings#index"
  post 'training', to: "trainings#create"
  delete 'training', to: "trainings#destroy"

  #sessions
  resources :sessions, only: [:create, :destroy]

end
