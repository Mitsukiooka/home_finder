Rails.application.routes.draw do
  devise_for :users
  devise_for :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :owner do
    root to: "home#index"
    resources :rooms do
      member do
        get 'application_show'
        post 'application_update', :as => 'application_update'
      end
    end
    resources :owner_profiles, except: [:index]
  end

  namespace :user do
    root to: "home#index"
    resources :rooms, only: [:index, :show] do
      member do
        get 'application_new'
        post 'create' => 'rooms#application_create', :as => 'application_create'
        get 'sent' => 'rooms#application_sent', :as => 'application_sent'
      end
      collection do
        get 'owner_show'
      end
    end
    resources :user_profiles, except: [:index]
  end
end
