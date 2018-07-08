Rails.application.routes.draw do
  root :to => "static#home"

  get 'forms', to: 'static#forms'
  resources :affiliations
  resources :payments
  resources :required_payments
  resources :permission_slips
  resources :trips do
    member do
      get 'dashboard'
    end
  end
  resources :stims
  resources :safety_tests
  resources :services
  resources :events
  resources :medicals
  resources :media_consents
  resources :team_dues
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :parents
  resources :teams
  resources :students do
    collection do
      get 'dashboard'
      post 'check'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
