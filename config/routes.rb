Rails.application.routes.draw do
  resources :recipes do
    resources :meal_plannings
  end

  post 'search', to: 'search#search', as: 'search'
  get '/recipes/search', to: 'recipes#search', as: 'recipes_search'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "pages#home"
end

