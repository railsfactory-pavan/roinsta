Rails.application.routes.draw do
  resources :locations

  resources :users do
    get :avatar, on: :member
    patch '/submit_registration_ids', to: 'users#submit_registration_ids'
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
