class MealPlanRecipe < ApplicationRecord
  belongs_to :meal_plan
  belongs_to :recipe
  belongs_to :user
end
