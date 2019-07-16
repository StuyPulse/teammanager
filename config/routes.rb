Rails.application.routes.draw do
  resources :trip_dismissals
  root :to => "static#home"

  get 'forms', to: 'static#forms'
  resources :affiliations
  resources :payments
  resources :required_payments
  resources :permission_slips
  resources :trips do
    member do
      get 'dashboard'
      get 'import'
      post 'import'
    end
  end
  resources :stims
  resources :safety_tests
  resources :services
  resources :events do
    member do
      get 'dashboard'
      get 'add_services'
      post 'add_services'
    end
  end
  resources :medicals
  resources :media_consents
  resources :team_dues
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :parents
  resources :teams
  resources :students do
    collection do
      get 'dashboard'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
