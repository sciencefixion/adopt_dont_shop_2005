class AddAdoptableToDaemons < ActiveRecord::Migration[5.1]
  def change
    add_column :daemons, :adoptable, :string
  end
end
