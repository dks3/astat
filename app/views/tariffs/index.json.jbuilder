json.array!(@tariffs) do |tariff|
  json.extract! tariff, :id, :title, :price
  json.url tariff_url(tariff, format: :json)
end
