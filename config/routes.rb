Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  "/cats", to: "cats#home", as: "cats"

  post "/cats", to: "cats#create"
  get  "/cats/new", to: "cats#new", as: "new_cat"

  get  "/cats/:id", to: "cat#show", as: "cat"

  put "/cats/:id", to: "cats#update"
  get "/cats/:id/edit", to: "cats#edit", as: "edit_cat"

  delete "/cats/:id", to: "cats#destroy"
  get "/cats/:id/delete", to: "cats#delete", as: "delete_cat"



end