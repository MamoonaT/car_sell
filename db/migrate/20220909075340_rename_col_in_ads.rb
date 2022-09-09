class RenameColInAds < ActiveRecord::Migration[5.2]
  def change
    rename_column :ads, :transmission, :transmission_type
    remove_column :ads, :type, :string
  end
end
