json.array!(@payments) do |payment|
  json.extract! payment, :datetime, :category, :method, :shared, :description, :amount
  json.url payment_url(payment, format: :json)
end
