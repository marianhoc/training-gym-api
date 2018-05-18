Rails.application.routes.draw do

  #usuarios
	get 'usernames', to: "users#names"
  resources :users

  #videos
  resources :videos
  
  #treinos
  get 'calendar', to: "trainings#index"
  post 'criatreino', to: "trainings#create"
  delete 'excluitreino', to: "trainings#destroy"

end
