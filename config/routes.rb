Rails.application.routes.draw do
  root 'docs#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :docs do
    resources :users_docs
  end

  resources :users, only: %i[new create]

  resource :session, only: %i[new create destroy]
end
