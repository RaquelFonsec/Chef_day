class MealPlanRecipesController < ApplicationController
  def create
  @meal_plan = MealPlan.find(params[:meal_plan_id])
  @recipe = Recipe.find(params[:recipe_id])
  @meal_plan_recipe = MealPlanRecipe.new(meal_plan: @meal_plan, recipe: @recipe)
  if @meal_plan_recipe.save
    render json: { success: true }
  else
    render json: { success: false, errors: @meal_plan_recipe.errors.full_messages }
  end
end
end
