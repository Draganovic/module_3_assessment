Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
   namespace :v1, defaults: { format: :json } do
     get "/items", to: "items#index"
     get "/items/:id",    to: "items#show"
     delete "/items/:id", to: "items#destroy"
     post "/items",       to: "items#create"
   end
 end

end
