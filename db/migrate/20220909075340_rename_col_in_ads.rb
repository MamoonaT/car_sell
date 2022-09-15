class RenameColInAds < ActiveRecord::Migration[5.2]
  def change
    rename_column :ads, :transmission, :transmission_type
    remove_column :ads, :type, :string
    rename_column :ads, :engine_capacity, :engine_type
    add_column :ads, :primary_contact, :string
    add_column :ads, :secondary_contact, :string
  end
end
