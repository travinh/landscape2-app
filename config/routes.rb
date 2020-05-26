Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/users', to: "users#index"

  # #index
  # get '/landscapes', to: "landscapes#index"

  # #new
  # get '/landscapes/new', to: "landscapes#new"

  # #show
  # get '/landscapes/:id', to: "landscapes#show", as: "landscape"

  # #create
  # post '/landscapes', to: "landscapes#create", as: "create_landscape"

  # #edit
  # get '/landscapes/:id/edit', to: "landscapes#edit", as: "edit_landscape"

  # #update
  # patch '/landscapes/:id', to: "landscapes#update"

  # #destroy
  # delete '/landscapes/:id', to: "landscapes#destroy"

  #  #index
  #  get '/teams', to: "teams#index"

  #  #new
  #  get '/teams/new', to: "teams#new"
 
  #  #show
  #  get '/teams/:id', to: "teams#show", as: "team"
 
  #  #create
  #  post '/teams', to: "teams#create", as: "create_teams"
 
  #  #edit
  #  get '/teams/:id/edit', to: "teams#edit", as: "edit_teams"
 
  #  #update
  #  patch '/teams/:id', to: "teams#update"
 
  #  #destroy
  #  delete '/teams/:id', to: "teams#destroy"

  resources :teams do 
    resources :landscapes, only: [:index, :show, :new, :create]
  end
  resources :landscapes




  get '/', to: "application#welcome"
  get '/:anything', to: "application#wrong_page"
end
