require "rails_helper"

RSpec.describe "pokemon/index", type: :view do
  it "displays all the widgets" do
    assign(:pokemon, [
      Pokemon.create!(:name => "Glumanda", :pokemon_type => "Feuer", :region => "Kanto"),
      Pokemon.create!(:name => "Groudon", :pokemon_type => "Boden", :region => "Hoenn")
    ])

    render

    expect(rendered).to match "Glumanda"
    expect(rendered).to match "Hoenn"
  end
end
