Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :characters, :campaigns, only: [:create, :show, :update, :destroy, :index]
      #resources :campaign, only: [:create, :show, :update, :destroy, :index]
    end
  end
end
