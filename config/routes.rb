Rails.application.routes.draw do
  # get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles do
    resources :comments
  end
  # Defines the root path route ("/")
end
