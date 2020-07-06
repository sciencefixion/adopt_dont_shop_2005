require "rails_helper"
# User Story 10, Shelter Pet Creation

# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
RSpec.describe "Create a new daemon" do
  describe "when visiting a shelter's daemons page" do
    it "allows adding a new daemon to a shelter" do
      shelter_2 = Shelter.create!(name: "Eve's Garden", address: "707 Tigris Street", city: "Eden", state: "UT", zip: "44000")
      daemon_2 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/024.Jacob_Wrestles_with_the_Angel.jpg", name: "Samael", approximate_age: "23,166", sex: "M", current_shelter: "Eve's Garden", shelter_id: shelter_2.id, description: "")

      visit "/shelters/#{shelter_2.id}/daemons"

      expect(page).to_not have_content("Lilith")

      click_on 'Create Daemon'

      expect(current_path).to eq("/shelters/#{shelter_2.id}/daemons/new")

      fill_in :image, with: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Lilith_%28John_Collier_painting%29.jpg"
      fill_in :name, with: "Lilith"
      fill_in :description, with: "Mephistopheles: Adam's wife, his first. Beware of her. Her beauty's one boast is her dangerous hair. When Lilith winds it tight around young men, she doesn't soon let go of them again. — Goethe's Faust: The First Part of the Tragety, 1992 Greenberg translation, lines 4206–4211"
      fill_in :approximate_age, with: "23,166"
      fill_in :sex, with: "F"

      click_on 'Create Daemon'

      expect(current_path).to eq("/shelters/#{shelter_2.id}/daemons")
      expect(page).to have_content("https://upload.wikimedia.org/wikipedia/commons/b/b6/Lilith_%28John_Collier_painting%29.jpg")
      expect(page).to have_content("Mephistopheles: Adam's wife, his first. Beware of her. Her beauty's one boast is her dangerous hair. When Lilith winds it tight around young men, she doesn't soon let go of them again. — Goethe's Faust: The First Part of the Tragety, 1992 Greenberg translation, lines 4206–4211")
      expect(page).to have_content("Lilith")
    end
  end
end
