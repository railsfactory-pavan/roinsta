Rails.application.routes.draw do
  resources :locations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    get :avatar, on: :member
  end

  resources :chats do
    collection do
      patch :update_message
      put :update_message
      delete :destroy_message
    end
  end

  resources :posts
  resources :photos
  
  resources :photos do
    get :show_images, on: :member
    post :add_images, on: :member
  end
  
  resources :comments
  resources :likes

  resources :followings

  post '/auth/login', to: 'authentication#login'
  get '/*', to: 'application#not_found'
end
