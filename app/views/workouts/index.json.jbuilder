json.array!(@workouts) do |workout|
  json.extract! workout, :datetime, :duration, :sport, :where, :comment
  json.url workout_url(workout, format: :json)
end
