class AddFieldsToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :email, :string
    add_column :hotels, :phone, :string
  end
end
