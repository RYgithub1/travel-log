Rails.application.routes.draw do
  devise_for :users

  root to: "maps#index"

  resources :maps, only: [:index]
  resources :users, only: [:show, :edit, :update]
  resources :aboutmes

  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

end
