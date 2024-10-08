class AddImageUrlToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :image_url, :string
  end
end
