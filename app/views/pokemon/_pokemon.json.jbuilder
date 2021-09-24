json.extract! pokemon, :id, :name, :pokemon_type, :region, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
