require "rails_helper"
# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
RSpec.describe "Shelter Daemons Index" do
  it "shows each daemon that can be adopted with the same shelter_id" do
    shelter_1 = Shelter.create!(name: "Sheol", address: "666 Infernal Blvd.", city: "Hell", state: "MI", zip: "99666")
    shelter_2 = Shelter.create!(name: "Eve's Garden", address: "707 Tigris Street", city: "Eden", state: "UT", zip: "44000")
    daemon_1 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/4/44/Bael.jpg", name: "Baal", approximate_age: "3000", sex: "M", current_shelter: "Sheol", shelter_id: shelter_1.id)
    daemon_2 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/024.Jacob_Wrestles_with_the_Angel.jpg", name: "Samael", approximate_age: "23,166", sex: "M", current_shelter: "Eve's Garden", shelter_id: shelter_2.id)
    daemon_3 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/b/b6/Lilith_%28John_Collier_painting%29.jpg", name: "Lilith", approximate_age: "23,166", sex: "F", current_shelter: "Eve's Garden", shelter_id: shelter_2.id)

    visit "/shelters/#{shelter_2.id}/daemons"

    expect(page).to have_content(daemon_2.image)
    expect(page).to have_content(daemon_2.name)
    expect(page).to have_content(daemon_2.approximate_age)
    expect(page).to have_content(daemon_2.sex)

    expect(page).to have_content("Lilith")
    expect(page).to_not have_content(daemon_1.name)

  end
end
