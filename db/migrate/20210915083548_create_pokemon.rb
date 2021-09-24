class CreatePokemon < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemon do |t|
      t.string :name
      t.string :type
      t.string :region

      t.timestamps
    end
  end
end
