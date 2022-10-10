Rails.application.routes.draw do
  resources :items
  root "splashes#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :groups do
    resources :entities
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
