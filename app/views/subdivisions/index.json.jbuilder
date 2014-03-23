json.array!(@subdivisions) do |subdivision|
  json.extract! subdivision, :id, :title
  json.url subdivision_url(subdivision, format: :json)
end
