Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'my_recipes', to: 'recipes#my_recipes', as: 'my_recipes'

  resources :recipes, only: [:index]
  resources :meal_plannings
end
