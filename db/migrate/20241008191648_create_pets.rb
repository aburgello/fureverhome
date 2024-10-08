class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :breed
      t.integer :age
      t.string :status
      t.string :image_url

      t.timestamps
    end
  end
end
