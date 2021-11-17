require "rails_helper"

RSpec.describe "Pokemon", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "enables me to create pokemon" do
    visit new_pokemon_path

    fill_in "Name", :with => "Groudon"
    fill_in "Pokemon type", :with => "Boden"
    fill_in "Region", :with => "Hoenn"
    click_button "Create Pokemon"

    expect(page).to have_current_path(pokemon_path(locale: "en", id: 1))
    expect(page).to have_text("Groudon")
  end

  it "enables me to search for a pokemon" do
    visit root_path
    pokemon_1 = Pokemon.create!(name: "Voltilamm", pokemon_type: "Elektro", region: "Johto")
    pokemon_2 = Pokemon.create!(name: "Groudon", pokemon_type: "Boden", region: "Hoenn")

    fill_in "Name", :with => "Groudon"
    click_button "Search"

    expect(page).to have_text(pokemon_2.name)
    expect(page).not_to have_text(pokemon_1.name)
  end

  it "enables me to use the advanced search function to search for a pokemon" do
    visit search_pokemon_index_path
    pokemon_1 = Pokemon.create!(name: "Glumanda", pokemon_type: "Feuer", region: "Kanto")
    pokemon_2 = Pokemon.create!(name: "Eneco", pokemon_type: "Normal", region: "Hoenn")
    pokemon_3 = Pokemon.create!(name: "Schiggy", pokemon_type: "Wasser", region: "Kanto")

    select "Feuer", :from => "Pokemon type"
    select "Kanto", :from => "Region"
    click_button "Search"

    expect(page).to have_text(pokemon_1.name)
    expect(page).not_to have_text(pokemon_2.name)
    expect(page).not_to have_text(pokemon_3.name)
  end
end
