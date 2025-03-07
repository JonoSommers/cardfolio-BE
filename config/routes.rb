Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create] do 
        resources :binders, only: [:create, :update] do 
          resources :binder_cards, only: [:create, :update]
        end
      end
    end
  end
end
