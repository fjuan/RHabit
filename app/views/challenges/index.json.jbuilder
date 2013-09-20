json.array!(@challenges) do |challenge|
  json.extract! challenge, :name, :user_id, :start_date, :end_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  json.url challenge_url(challenge, format: :json)
end
