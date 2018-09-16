Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods
      resources :meals, except: [:show, :destroy] do
        get '/foods', to: 'meals#show'
        post '/foods/:id', to: 'meals#create'
        delete '/foods/:id', to: 'meals#destroy'
      end
    end
  end
end
