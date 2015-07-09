Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :profiles
  resources :pictures

  root 'welcome#index'

end
