Rails.application.routes.draw do
  resources :messages
  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
