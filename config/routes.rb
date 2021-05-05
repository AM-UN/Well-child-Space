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
  resources :answers, only: [:edit, :update, :destroy]
  
  post "questions/:id", to: "answers#create"

  post "favorites/:question_id/create", to: "favorites#create"
  delete "favorites/:question_id/destroy" => "favorites#destroy"

  post "interests/:answer_id/create", to: "interests#create"
  delete "interests/:answer_id/destroy" => "interests#destroy"

  get "users/:id/answers", to: "users#answers"
  get "users/:id/favorites", to: "users#favorites"
  get "users/:id/interests", to: "users#interests"
   
end
