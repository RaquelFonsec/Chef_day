Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  get '/recipes/search', to: 'recipes#search', as: 'recipes_search'

  resources :recipes do
    post :save, on: :member
  end

  resources :meal_plannings

  resources :meal_plan_recipes, only: [:create]

  resources :meal_plans, only: [:new, :create]
end
