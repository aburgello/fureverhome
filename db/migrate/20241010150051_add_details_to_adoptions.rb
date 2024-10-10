class AddDetailsToAdoptions < ActiveRecord::Migration[7.2]
  def change
    # Check and add the adopter_name column if it doesn't exist
    unless column_exists?(:adoptions, :adopter_name)
      add_column :adoptions, :adopter_name, :string
    end

    # Check and add the adopter_email column if it doesn't exist
    unless column_exists?(:adoptions, :adopter_email)
      add_column :adoptions, :adopter_email, :string
    end

    # Check and add the message column if it doesn't exist
    unless column_exists?(:adoptions, :message)
      add_column :adoptions, :message, :text
    end
  end
end
