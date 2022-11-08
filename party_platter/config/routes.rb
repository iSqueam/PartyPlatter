Rails.application.routes.draw do
  get 'current_user/index'
  namespace :api do
    namespace :v1 do
      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations',
        passwords: 'api/v1/users/passwords',
        confirmations: 'api/v1/users/confirmations',
        unlocks: 'api/v1/users/unlocks'
      }
      resources :characters, :campaigns, only: [:create, :show, :update, :destroy, :index]
      get '/current_user', to: 'current_user#index'
    end
  end
end