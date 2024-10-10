class AddDetailsToAdoptions < ActiveRecord::Migration[7.2]
  def change
    add_column :adoptions, :adopter_name, :string
    add_column :adoptions, :adopter_email, :string
    add_column :adoptions, :message, :text
  end
end
