require "rails_helper"
# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
RSpec.describe "when visiting a shelter show page" do
  it "allows destruction of a shelter" do
    shelter_1 = Shelter.create(name: "Gimme Shelter", address: "1234 What Street", city: "Springfield", state: "IN", zip: "12345")
    shelter_2 = Shelter.create(name: "Shelter Too", address: "5678 Who Street", city: "Bluffington", state: "IL", zip: "54321")

    visit "/shelters/#{shelter_2.id}"

    expect(page).to have_content("Shelter Too")

    click_on 'Delete Shelter'

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Shelter Too")
  end
end
