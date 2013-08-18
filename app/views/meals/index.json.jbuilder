json.array!(@meals) do |meal|
  json.extract! meal, :datetime, :where, :kind, :description
  json.url meal_url(meal, format: :json)
end
