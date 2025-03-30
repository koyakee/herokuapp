class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :area
      t.string :facilityName
      t.string :facilityDetails
      t.string :facilityAddress
      t.integer :facilityFee
      t.integer :user_id
      t.integer :reservation_id
      
      t.timestamps
    end
  end
end
