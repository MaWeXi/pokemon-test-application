require "application_system_test_case"

class PokemonTest < ApplicationSystemTestCase
  setup do
    @pokemon = pokemon(:one)
  end

  test "visiting the index" do
    visit pokemon_url
    assert_selector "h1", text: "Pokemon"
  end

  test "creating a Pokemon" do
    visit pokemon_url
    click_on "New Pokemon"

    fill_in "Name", with: @pokemon.name
    fill_in "Region", with: @pokemon.region
    fill_in "Type", with: @pokemon.type
    click_on "Create Pokemon"

    assert_text "Pokemon was successfully created"
    click_on "Back"
  end

  test "updating a Pokemon" do
    visit pokemon_url
    click_on "Edit", match: :first

    fill_in "Name", with: @pokemon.name
    fill_in "Region", with: @pokemon.region
    fill_in "Type", with: @pokemon.type
    click_on "Update Pokemon"

    assert_text "Pokemon was successfully updated"
    click_on "Back"
  end

  test "destroying a Pokemon" do
    visit pokemon_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pokemon was successfully destroyed"
  end
end
