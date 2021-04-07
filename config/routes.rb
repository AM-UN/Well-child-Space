Rails.application.routes.draw do
  root to: "questions#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update]
  resources :questions
end
