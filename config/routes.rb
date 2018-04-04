Rails.application.routes.draw do
  resources :auths
    resources :users
    resources :books
    post 'login'  => 'login#auth_user'
    post 'logout'  => 'login#destroy'
    get 'home/index'

    root 'home#index'
end
