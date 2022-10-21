Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :articles 
    end
  end
  # get 'articles/index' 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  resources :articles do
    resources :comments
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
