class Search < ApplicationRecord
    self.inheritance_column = "not_sti"

    def search_pokemon
        pokemon = Pokemon.all 

        pokemon = pokemon.where(['name LIKE ?', name]) if name.present?
        pokemon = pokemon.where(['type LIKE ?', type]) if type.present?
        pokemon = pokemon.where(['region LIKE ?', region]) if region.present?

        return pokemon
    end 
end
