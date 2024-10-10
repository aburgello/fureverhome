class CreateAdoptions < ActiveRecord::Migration[7.2]
  def change
    create_table :adoptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
