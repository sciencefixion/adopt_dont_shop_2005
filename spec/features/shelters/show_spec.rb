require "rails_helper"
# User Story 3, Shelter Show
# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip
RSpec.describe "Shelters show page" do
  it "shows all name, address, city, state, and zip for a particular shelter" do
    shelter_1 = Shelter.create(name: "Gimme Shelter", address: "1234 What Street", city: "Springfield", state: "IN", zip: "12345")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
