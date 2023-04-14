require "test_helper"

class MealPlanningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_planning = meal_plannings(:one)
  end

  test "should get index" do
    get meal_plannings_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_planning_url
    assert_response :success
  end

  test "should create meal_planning" do
    assert_difference("MealPlanning.count") do
      post meal_plannings_url, params: { meal_planning: { end_date: @meal_planning.end_date, start_date: @meal_planning.start_date, title: @meal_planning.title } }
    end

    assert_redirected_to meal_planning_url(MealPlanning.last)
  end

  test "should show meal_planning" do
    get meal_planning_url(@meal_planning)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_planning_url(@meal_planning)
    assert_response :success
  end

  test "should update meal_planning" do
    patch meal_planning_url(@meal_planning), params: { meal_planning: { end_date: @meal_planning.end_date, start_date: @meal_planning.start_date, title: @meal_planning.title } }
    assert_redirected_to meal_planning_url(@meal_planning)
  end

  test "should destroy meal_planning" do
    assert_difference("MealPlanning.count", -1) do
      delete meal_planning_url(@meal_planning)
    end

    assert_redirected_to meal_plannings_url
  end
end
