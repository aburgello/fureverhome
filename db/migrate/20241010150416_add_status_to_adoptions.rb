class AddStatusToAdoptions < ActiveRecord::Migration[7.2]
  def change
    add_column :adoptions, :status, :string
  end
end
