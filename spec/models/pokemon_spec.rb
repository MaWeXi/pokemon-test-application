require "rails_helper"

RSpec.describe Pokemon, type: :model do
  describe "creation" do

    it "Pokeomon can be created if valid / not created if invalid and returns given parameter" do
      pokemon = Pokemon.create(name: "Voltilamm", pokemon_type: "Elektro", region: "Johto")
      pokemon_1 = Pokemon.create(name: "Wiesor", pokemon_type: "Normal")

      region = pokemon.region

      expect(pokemon).to be_valid
      expect(region).to eq "Johto"
      expect(pokemon_1).to be_invalid
    end
  end
end
