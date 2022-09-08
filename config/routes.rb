Rails.application.routes.draw do
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  root "home#index"

  resources 'categories', only: %w[index new create] do
    resources 'transactions', only: %w[index]
  end

  resources 'transactions', only: %w[new create]
end
