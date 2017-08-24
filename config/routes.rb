Rails.application.routes.draw do
  devise_for :users
  root :to => "students#index"

  resources :parents
  resources :students
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
