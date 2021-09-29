require 'rails_helper'

RSpec.describe "Pokemon", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "enables me to create pokemon" do
    visit "/pokemon/new"

    fill_in 'Name', :with => 'Groudon'
    fill_in 'Pokemon type', :with => 'Boden'
    fill_in 'Region', :with => 'Hoenn'
    click_button 'Create Pokemon'
    
    expect(page).to have_text('Groudon')
  end

=begin
  it "enables me to search for a pokemon" do
    visit "/pokemon/search"

    fill_in 'Name', :with => 'Glumanda'
    click_button 'Search'

    expect(page).to have_text('Glumanda')
  end
=end

end
