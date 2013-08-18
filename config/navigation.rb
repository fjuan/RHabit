SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :payments,   'Payments',   payments_path,    highlights_on: :subpath
    primary.item :meals,      'Meals',      meals_path,       highlights_on: :subpath
    primary.item :chronicles, 'Chronicles', chronicles_path,  highlights_on: :subpath

    primary.dom_class = 'nav'
  end
end