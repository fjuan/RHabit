SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :payments,   'Payment',    payments_path
    primary.item :meals,      'Meals',      meals_path
    primary.item :chronicles, 'Chronicles', chronicles_path

    primary.dom_class = 'nav'
  end
end