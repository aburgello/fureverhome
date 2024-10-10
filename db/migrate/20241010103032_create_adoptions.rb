class CreateAdoptions < ActiveRecord::Migration[6.0]
  def change
    create_table :adoptions do |t|
      t.bigint :user_id, null: false
      t.bigint :pet_id, null: false
      t.string :adopter_name
      t.string :adopter_email
      t.text :message
      t.string :status
      t.timestamps null: false
    end

    add_index :adoptions, :user_id
    add_index :adoptions, :pet_id
  end
end
