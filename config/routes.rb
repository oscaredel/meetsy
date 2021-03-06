Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#new'

  resources :events, only: [:show, :create, :update] do
    resources :responses, only: [:create, :edit, :update, :destroy]
    resources :updates, only: [:create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :photos, only: [:index, :show, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  get 'orders/:id/complete', to: 'orders#complete', as: 'complete_order'
  get '/organisers/:id/manage', to: 'events#manage', as: 'manage_event'
  get '/organisers/:id/edit', to: 'events#edit', as: 'edit_event'
  delete '/organisers/:id/destroy', to: 'events#destroy', as: 'destroy_event'
  get '/responses/:id/manage', to: 'responses#manage', as: 'manage_response'

  get 'howitworks', to: 'pages#howitworks'
end
