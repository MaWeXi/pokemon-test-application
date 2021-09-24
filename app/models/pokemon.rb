class Pokemon < ApplicationRecord

    scope :filter_by_name, -> (name) { where("name like ?", "#{name}%")}
    scope :filter_by_pokemon_type, -> (pokemon_type) { where("pokemon_type like ?", "#{pokemon_type}%")}
    scope :filter_by_region, -> (region) { where("region like ?", "#{region}%")}
end
