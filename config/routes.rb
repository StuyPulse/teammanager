Rails.application.routes.draw do
  resources :team_dues
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root :to => "static#home"

  resources :parents
  resources :teams
  resources :students do
    collection do
      post 'check'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
