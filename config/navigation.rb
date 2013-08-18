SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :payments,   'Payments',   payments_path
    primary.item :meals,      'Meals',      meals_path
    primary.item :chronicles, 'Chronicles', chronicles_path

    primary.dom_class = 'nav'
  end
end