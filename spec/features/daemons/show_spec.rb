require "rails_helper"
# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
RSpec.describe "Daemon Show page" do
  it "shows image, name, description, approximate_age, sex, and adoptable/pending adoption status for a particular daemon" do
    shelter_1 = Shelter.create!(name: "Sheol", address: "666 Infernal Blvd.", city: "Hell", state: "MI", zip: "99666")
    daemon_1 = Daemon.create!(image: "https://upload.wikimedia.org/wikipedia/commons/4/44/Bael.jpg", name: "Baal", approximate_age: "3000", sex: "M", current_shelter: "Sheol", shelter_id: shelter_1.id, description: "He is described as a hoarsely-voiced king with the powers of invisiblilty, love, and the sciences, and ruling over sixty-six legions of demons. He can take the form of a cat, toad, man, or some combination thereof with the heads of a cat, toad, and human simultaneously.", adoptable: "Adoptable")

    visit "/daemons/#{daemon_1.id}"

    expect(page).to have_content(daemon_1.image)
    expect(page).to have_content(daemon_1.name)
    expect(page).to have_content("He is described as a hoarsely-voiced king with the powers of invisiblilty, love, and the sciences, and ruling over sixty-six legions of demons. He can take the form of a cat, toad, man, or some combination thereof with the heads of a cat, toad, and human simultaneously.")
    expect(page).to have_content(daemon_1.approximate_age)
    expect(page).to have_content(daemon_1.sex)
    expect(page).to have_content("Adoptable")
  end
end
