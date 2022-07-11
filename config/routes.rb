Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :chats do
    collection do
      delete :destroy_message
    end
  end

  resources :posts
  resources :photos
  resources :comments
  resources :likes

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
