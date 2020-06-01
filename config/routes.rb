Rails.application.routes.draw do
  devise_for :users

  # get 'messages/index'
  root to: 'groups#index'

  resources :maps, only: [:index]
  resources :users, only: [:edit, :update, :show]
  resources :aboutmes

  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

end
