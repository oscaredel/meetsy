Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#new'

  resources :events, only: [:show, :create, :edit, :update, :destroy] do
    resources :responses, only: [:create, :edit, :update, :destroy]
    resources :updates, only: [:create, :destroy]
  end

  get '/organisers/:id/manage', to: 'events#manage', as: 'manage_event'
  get '/responses/:id/manage', to: 'responses#manage', as: 'manage_response'
end
