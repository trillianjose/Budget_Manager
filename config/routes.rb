Rails.application.routes.draw do
  get 'expenses/index'

  root 'dashboard#index'

  devise_for :users
  
  resources :dashboard, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
