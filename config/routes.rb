Rails.application.routes.draw do
  root :to => "static#home"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'forms', to: 'static#forms'

  resources :parents
  resources :teams
  resources :students do
    collection do
      get 'dashboard'
    end
  end

  resources :payments
  resources :permission_slips
  resources :trip_dismissals
  resources :trips do
    member do
      get 'dashboard'
      get 'import'
      post 'import'
    end
  end

  resources :events do
    member do
      get 'dashboard'
      get 'add_services'
      post 'add_services'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
