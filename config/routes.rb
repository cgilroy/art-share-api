Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :artworks, only: [:index]
  end
  resources :artworks
  resources :artwork_shares, only: [:create, :destroy]

  get '/users/:user_id/artworks', to: 'users#index'
end
