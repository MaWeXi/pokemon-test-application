class RenameTypeToPokemonType < ActiveRecord::Migration[6.1]
  def change
    rename_column :pokemon, :type, :pokemon_type
    rename_column :searches, :type, :pokemon_type
  end
end
