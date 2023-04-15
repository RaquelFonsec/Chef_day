Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  get '/recipes/search', to: 'recipes#search', as: 'recipes_search'

  resources :recipes do
    member do
      post :add_to_meal_plan
    end
    resources :meal_plannings
  end

  resources :meal_plan_recipes, only: [:create]

  resources :meal_plans, only: [:new, :create]

end
