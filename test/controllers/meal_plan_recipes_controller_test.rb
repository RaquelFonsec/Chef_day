require "test_helper"

class MealPlanRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get meal_plan_recipes_create_url
    assert_response :success
  end
end
