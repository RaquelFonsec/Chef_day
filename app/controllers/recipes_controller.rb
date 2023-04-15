require 'net/http'

class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:my_recipes]

  def index
    if params[:query].present?
      app_id = ENV['EDAMAM_APP_ID']
      app_key = ENV['EDAMAM_APP_KEY_1']
      url = URI("https://api.edamam.com/search?q=#{params[:query]}&app_id=#{app_id}&app_key=#{app_key}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      @recipes = data['hits'].map do |hit|
        {
          name: hit['recipe']['label'],
          ingredients: hit['recipe']['ingredientLines'],
          image: hit['recipe']['image'],
          source: hit['recipe']['source'],
          url: hit['recipe']['url']
        }
      end
    else
      @recipes = Recipe.all
    end
  end

  def search
    if params[:search_term].present?
      @recipes = Recipe.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @recipes = Recipe.all
    end
  end

  def my_recipes
    @recipes = current_user.recipes
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  private

  def recipe_params
    params.fetch(:recipe, {}).permit(:name, :ingredients, :instructions, :image)
  end
end
