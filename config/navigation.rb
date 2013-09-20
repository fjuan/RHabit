SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :meals,      Meal.model_name.human(count: 2),      meals_path,      highlights_on: :subpath, :if => Proc.new { current_user.use_meals } 
    primary.item :payments,   Payment.model_name.human(count: 2),   payments_path,   highlights_on: :subpath, :if => Proc.new { current_user.use_payments } 
    primary.item :workouts,   Workout.model_name.human(count: 2),   workouts_path,   highlights_on: :subpath, :if => Proc.new { current_user.use_workouts } 
    primary.item :challenges, Challenge.model_name.human(count: 2), challenges_path, highlights_on: :subpath, :if => Proc.new { current_user.use_challenges } 
    primary.item :chronicles, Chronicle.model_name.human(count: 2), chronicles_path, highlights_on: :subpath, :if => Proc.new { current_user.use_chronicles } 

    primary.dom_class = 'nav'
  end
end