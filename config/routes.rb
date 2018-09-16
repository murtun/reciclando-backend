Rails.application.routes.draw do
  resources :organizations, only: [] do
    resources :users, only: %i[index show]
  end

  resources :bales, only: %i[index create show]

  mount SwaggerUiEngine::Engine, at: '/api_docs'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
