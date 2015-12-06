json.array!(@foods) do |food|
  json.extract! food, :id, :name, :description, :price, :section, :imageUrl
  json.url food_url(food, format: :json)
end
