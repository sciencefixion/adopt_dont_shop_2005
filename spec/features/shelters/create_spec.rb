require "rails_helper"
# User Story 4, Shelter Creation
#
# As a visitor
# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
RSpec.describe "Create a new shelter" do
  describe "when visiting the shelters index page" do
    it "clicks a link that allows creation of a new shelter" do
      visit '/shelters'

      expect(page).to_not have_content("Gimme Shelter")

      click_on 'New Shelter'

      expect(current_path).to eq('/shelters/new')

      fill_in :name, with: "Gimme Shelter"
      fill_in :address, with: "1234 What Street"
      fill_in :city, with: "Springfield"
      fill_in :state, with: "IN"
      fill_in :zip, with: "12345"

      click_on 'Create Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Gimme Shelter")
    end
  end
end
