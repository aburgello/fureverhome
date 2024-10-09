class AddImageToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :image, :string
  end
end
