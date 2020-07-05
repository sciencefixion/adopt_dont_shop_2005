class AddDescriptionToDaemons < ActiveRecord::Migration[5.1]
  def change
    add_column :daemons, :description, :string
  end
end
