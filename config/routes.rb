Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/show'
  get 'expenses/index'
  get 'expenses/new'
  get 'expenses/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
