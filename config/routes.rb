Rails.application.routes.draw do
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
