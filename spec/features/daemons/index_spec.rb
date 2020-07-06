require "rails_helper"
# User Story 7, Pet Index
#
# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
RSpec.describe "Daemons index page", type: :feature do
  it "returns a list of all daemons in the system" do
    shelter_1 = Shelter.create!(name: "Sheol", address: "666 Infernal Blvd.", city: "Hell", state: "MI", zip: "99666")
    shelter_2 = Shelter.create!(name: "Eve's Garden", address: "707 Tigris Street", city: "Eden", state: "UT", zip: "44000")
    daemon_1 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/4/44/Bael.jpg", name: "Baal", approximate_age: "3000", sex: "M", current_shelter: "Sheol", shelter_id: shelter_1.id)
    daemon_2 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/024.Jacob_Wrestles_with_the_Angel.jpg", name: "Samael", approximate_age: "23,166", sex: "M", current_shelter: "Eve's Garden", shelter_id: shelter_2.id)
    daemon_3 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Lilith_%28John_Collier_painting%29.jpg", name: "Lilith", approximate_age: "23,166", sex: "F", current_shelter: "Eve's Garden", shelter_id: shelter_2.id)
    visit "/daemons"

    expect(page).to have_content(daemon_2.name)
    expect(page).to have_content("Lilith")
    expect(page).to have_content("Sheol")
  end
end
