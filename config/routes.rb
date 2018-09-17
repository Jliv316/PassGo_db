Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'companies#new'
  resources :companies
  namespace :api do
    namespace :v1 do
      resources :companies
      resources :users
      resources :users do
        post '/locations', to: 'users/locations#create'
      end
    end
  end
end
