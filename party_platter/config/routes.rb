Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :characters, :campaigns, only: [:create, :show, :update, :destroy, :index]
    end
  end
end
