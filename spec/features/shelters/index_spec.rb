require "rails_helper"
# User Story 2, Shelter Index
# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system
RSpec.describe "shelters index page", type: :feature do
  it 'returns a list of all shelters' do
    shelter_1 = Shelter.create(name: "Gimme Shelter", address: "1234 What Street", city: "Springfield", state: "IN", zip: "12345")
    shelter_2 = Shelter.create(name: "Shelter Two", address: "5678 Who Street", city: "Bluffington", state: "IL", zip: "54321")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
