class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :city
      t.string :car_make
      t.string :price
      t.string :milage
      t.string :transmission
      t.string :type
      t.string :assembly_type
      t.string :engine_capacity
      t.string :color
      t.string :add_description
      t.integer :user_id

      t.timestamps
    end
  end
end
