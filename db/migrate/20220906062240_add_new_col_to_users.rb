# frozen_string_literal: true

# AddNewColToUsers
class AddNewColToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
  end
end
