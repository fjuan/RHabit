SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :payments,   Payment.model_name.human(count: 2),   payments_path,   highlights_on: :subpath
    primary.item :meals,      Meal.model_name.human(count: 2),      meals_path,      highlights_on: :subpath
    primary.item :workouts,   Workout.model_name.human(count: 2),   workouts_path,   highlights_on: :subpath
    primary.item :chronicles, Chronicle.model_name.human(count: 2), chronicles_path, highlights_on: :subpath

    primary.dom_class = 'nav'
  end
end