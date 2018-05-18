Rails.application.routes.draw do

  #usuarios
	get 'usernames', to: "users#names"
  resources :users

  #videos
  resources :videos
  
  #treinos
  get 'trainings', to: "trainings#index"
  post 'training', to: "trainings#create"
  delete 'training', to: "trainings#destroy"

end
