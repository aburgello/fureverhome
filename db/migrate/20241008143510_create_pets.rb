class CreatePets < ActiveRecord::Migration[7.2]
  def change
    create_table :pets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :breed
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
