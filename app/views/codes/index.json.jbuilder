json.array!(@codes) do |code|
  json.extract! code, :id, :city_code, :country_code
  json.url code_url(code, format: :json)
end
