Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   get 'user/', to: 'users#index', as: 'users'
#   get 'user/:id', to: 'users#show'
#   post 'user/', to: 'users#create'
#   patch 'user/:id', to: 'users#update'
#   put 'user/:id', to: 'users#update'
#   delete 'user/:id', to: 'users#delete'
#   get 'user/:id/edit', to: 'users#edit', as: 'edit_user'
#   get 'user/new', to: 'users#new'\

  resources :users, only: [:create, :show, :index, :destroy, :update] do
    resources :artworks, only: [:index] do
      resources :comments, only: [:index]
    end
  end
  resources :artworks, only: [:create, :index, :destroy, :update] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create,:destroy]

  resources :comments, only: [:create, :destroy, :index]
end
