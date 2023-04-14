require "application_system_test_case"

class MealPlanningsTest < ApplicationSystemTestCase
  setup do
    @meal_planning = meal_plannings(:one)
  end

  test "visiting the index" do
    visit meal_plannings_url
    assert_selector "h1", text: "Meal plannings"
  end

  test "should create meal planning" do
    visit meal_plannings_url
    click_on "New meal planning"

    fill_in "End date", with: @meal_planning.end_date
    fill_in "Start date", with: @meal_planning.start_date
    fill_in "Title", with: @meal_planning.title
    click_on "Create Meal planning"

    assert_text "Meal planning was successfully created"
    click_on "Back"
  end

  test "should update Meal planning" do
    visit meal_planning_url(@meal_planning)
    click_on "Edit this meal planning", match: :first

    fill_in "End date", with: @meal_planning.end_date
    fill_in "Start date", with: @meal_planning.start_date
    fill_in "Title", with: @meal_planning.title
    click_on "Update Meal planning"

    assert_text "Meal planning was successfully updated"
    click_on "Back"
  end

  test "should destroy Meal planning" do
    visit meal_planning_url(@meal_planning)
    click_on "Destroy this meal planning", match: :first

    assert_text "Meal planning was successfully destroyed"
  end
end
