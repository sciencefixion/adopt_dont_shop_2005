class AddSheltersToDaemons < ActiveRecord::Migration[5.1]
  def change
    add_reference :daemons, :shelter, foreign_key: true
  end
end
