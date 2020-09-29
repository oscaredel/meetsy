Rails.application.routes.draw do
  root to: 'events#new'

  resources :events, only: [:show, :create, :edit, :update, :destroy] do
    resources :responses, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
