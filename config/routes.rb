Rails.application.routes.draw do
  # get 'products/index'

  # get 'products/show'

  # get 'products/create'

  resources :products

  post 'products/buy' => 'products#buy'

  post 'products/remove' => 'products#remove'


  resources :user

  root 'user#new'

  post '/login' => 'user#login'

  get '/logout' => 'user#logout'
  # get 'user/new'

  # get 'user/create'

  # get 'user/show'

  # get 'user/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
