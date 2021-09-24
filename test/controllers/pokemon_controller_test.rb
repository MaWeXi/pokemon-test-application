require "test_helper"

class PokemonControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon = pokemon(:one)
  end

  test "should get index" do
    get pokemon_index_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_url
    assert_response :success
  end

  test "should create pokemon" do
    assert_difference('Pokemon.count') do
      post pokemon_index_url, params: { pokemon: { name: @pokemon.name, region: @pokemon.region, type: @pokemon.type } }
    end

    assert_redirected_to pokemon_url(Pokemon.last)
  end

  test "should show pokemon" do
    get pokemon_url(@pokemon)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_url(@pokemon)
    assert_response :success
  end

  test "should update pokemon" do
    patch pokemon_url(@pokemon), params: { pokemon: { name: @pokemon.name, region: @pokemon.region, type: @pokemon.type } }
    assert_redirected_to pokemon_url(@pokemon)
  end

  test "should destroy pokemon" do
    assert_difference('Pokemon.count', -1) do
      delete pokemon_url(@pokemon)
    end

    assert_redirected_to pokemon_index_url
  end
end
