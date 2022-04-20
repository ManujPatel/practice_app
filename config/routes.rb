Rails.application.routes.draw do
  devise_for :users
  root "products#home"
  resources :products do
    post 'import', on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
