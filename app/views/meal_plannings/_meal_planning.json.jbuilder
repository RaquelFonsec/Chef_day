json.extract! meal_planning, :id, :title, :start_date, :end_date, :created_at, :updated_at
json.url meal_planning_url(meal_planning, format: :json)
