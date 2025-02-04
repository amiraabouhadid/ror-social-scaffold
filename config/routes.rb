Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  post '/accept_friendship/', to: 'users#accept_friendship'
  get '/reject_friendship/:id', to: 'users#reject_friendship', as: 'reject_friendship'

  resources :users, only: %i[index show] do
    resources :friendships, only: [:create]
  end

  resources :posts, only: %i[index create] do
    resources :comments, only: [:create]
    resources :likes, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
