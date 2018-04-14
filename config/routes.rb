Rails.application.routes.draw do
  resources :homemsgs
  resources :home
  resources :auths
  resources :users
  resources :books

  post 'login'  => 'login#auth_user'
  post 'logout'  => 'login#destroy'

  root 'home#index'
end
