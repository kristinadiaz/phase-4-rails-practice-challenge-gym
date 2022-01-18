Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms
  resources :clients, only: [:index, :show, :update]
end
