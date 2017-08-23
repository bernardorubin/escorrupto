Rails.application.routes.draw do
  get 'target/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'
  root to:'targets#index'
  resources :targets, shallow: true do
    resources :likes, only: [:create, :destroy]
  end
end
