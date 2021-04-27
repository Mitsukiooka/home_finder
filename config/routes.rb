Rails.application.routes.draw do
  devise_for :owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :owner do
    root to: "home#index"
    resources :rooms
  end
end
