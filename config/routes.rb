Rails.application.routes.draw do
  devise_for :users
  devise_for :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :owner do
    root to: "home#index"
    resources :rooms
    resources :owner_profiles, except: [:index]
  end

  namespace :user do
    root to: "home#index"
    resources :rooms, only: [:index, :show]
    resources :user_profiles, except: [:index]
  end
end
