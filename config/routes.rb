Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/users', to: "users#index"

  #index
  get '/landscapes', to: "landscapes#index"

  #new
  get '/landscapes/new', to: "landscapes#new"

  #show
  get '/landscapes/:id', to: "landscapes#show", as: "landscape"

  #create
  post '/landscapes', to: "landscapes#create", as: "create_landscape"

  #edit
  get '/landscapes/:id/edit', to: "landscapes#edit", as: "edit_landscape"

  #update
  patch '/landscapes/:id', to: "landscapes#update"

  #destroy
  delete '/landscapes/:id', to: "landscapes#destroy"

  get '/', to: "application#welcome"
  get '/:anything', to: "application#wrong_page"
end
