Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'recipes/search'
  post 'recipes', to: 'recipes#create'
  resources :recipes, only: [:index]
  resources :meal_plannings
end

