require "rails_helper"

RSpec.describe "Pokemon", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "enables me to create pokemon" do
    #user = create(:user)    ## uncomment if using FactoryBot
    user = User.create!(
      username: "testuser",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password")
    sign_in(user)

    visit new_pokemon_path

    fill_in "Name", :with => "Groudon"
    fill_in "Type", :with => "Boden"
    fill_in "Region", :with => "Hoenn"
    click_button "Create Pokemon"

    expect(page).to have_current_path(pokemon_path(locale: "en", id: 1))
    expect(page).to have_text("Groudon")
  end

  it "enables me to search for a pokemon" do
    pokemon_1 = Pokemon.create!(name: "Voltilamm", pokemon_type: "Elektro", region: "Johto")
    pokemon_2 = Pokemon.create!(name: "Groudon", pokemon_type: "Boden", region: "Hoenn")

    visit root_path

    fill_in "Name", :with => "Groudon"
    click_button "Search"

    expect(page).to have_text(pokemon_2.name)
    expect(page).not_to have_text(pokemon_1.name)
  end

  it "enables me to use the advanced search function to search for a pokemon" do
    pokemon_1 = Pokemon.create!(name: "Glumanda", pokemon_type: "Feuer", region: "Kanto")
    pokemon_2 = Pokemon.create!(name: "Eneco", pokemon_type: "Normal", region: "Hoenn")
    pokemon_3 = Pokemon.create!(name: "Schiggy", pokemon_type: "Wasser", region: "Kanto")

    visit search_pokemon_index_path

    fill_in "name", :with => "Glumanda"
    select "Feuer", :from => "pokemon_type"
    select "Kanto", :from => "region"
    click_button "Search"

    expect(page).to have_text(pokemon_1.name)
    expect(page).not_to have_text(pokemon_2.name)
    expect(page).not_to have_text(pokemon_3.name)
  end
end
