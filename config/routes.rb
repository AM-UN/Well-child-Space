Rails.application.routes.draw do

  root to: "questions#index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    get "edit/password", to: "devise/registrations#edit"
  end

  resources :users, only: [:show, :edit, :update]
  resources :questions
  resources :answers, only: [:edit, :update]
  
  post "questions/:id", to: "answers#create"
  
end
