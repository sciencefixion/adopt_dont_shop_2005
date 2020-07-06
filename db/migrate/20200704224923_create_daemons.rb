class CreateDaemons < ActiveRecord::Migration[5.1]
  def change
    create_table :daemons do |t|
      t.string :image
      t.string :name
      t.string :approximate_age
      t.string :sex
      t.string :current_shelter
      t.string :adoptable, default: "Adoptable"
      t.timestamps
    end
  end
end
