json.array!(@chronicles) do |chronicle|
  json.extract! chronicle, :date, :summary, :mood
  json.url chronicle_url(chronicle, format: :json)
end
