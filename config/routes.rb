Rails.application.routes.draw do

  root to: "questions#index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  
  resources :users, only: [:show, :edit, :update]
  
  devise_scope :user do
    get "edit/password", to: "devise/registrations#edit"
  end

  resources :questions
  
end
