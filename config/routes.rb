Rails.application.routes.draw do

  get 'posts/index'

  root 'home#welcome'

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
