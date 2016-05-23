class AddRawDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_raw_data, :text
  end
end
