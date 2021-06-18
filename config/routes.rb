Rails.application.routes.draw do
  resources :categories
  devise_for :users
   get 'home/index'
   root to: "home#index"

      
   resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection, as: :us
    resources :comments
    #resources :users
   end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
