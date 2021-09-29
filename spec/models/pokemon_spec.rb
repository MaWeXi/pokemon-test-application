require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe "creation" do

    it "can be created if valid" do
      pokemon = Pokemon.create(name: 'Voltilamm', pokemon_type: 'Elektro', region: 'Johto')
      expect(pokemon).to be_valid
    end

    it "cannot be created if invalid" do
      expect(Pokemon.create(name: 'Wiesor', pokemon_type: 'Normal')).to be_invalid
    end

    it 'returns the region of the pokemon after successful creation' do
      expect(Pokemon.create(name: 'Voltilamm', pokemon_type: 'Elektro', region: 'Johto').region)
                                                                                        .to eq 'Johto'
    end
  end
end
