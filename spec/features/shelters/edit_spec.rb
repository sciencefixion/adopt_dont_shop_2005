require "rails_helper"
# User Story 5, Shelter Update
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
RSpec.describe "Shelter Edit" do
  it "links to a shelter info edit page" do
    shelter_1 = Shelter.create(name: "some shelter", address: "?", city: "?", state: "?", zip: "?")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to_not have_content("Gimme Shelter")

    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Gimme Shelter"
    fill_in :address, with: "1234 What Street"
    fill_in :city, with: "Springfield"
    fill_in :state, with: "IN"
    fill_in :zip, with: "12345"

    click_on 'Submit'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Gimme Shelter")
  end
end
