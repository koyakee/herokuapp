class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :area
      t.string :facility_name
      t.string :facility_details
      t.string :facility_address
      t.integer :facility_fee
      t.integer :user_id
      t.timestamps
    end
  end
end
