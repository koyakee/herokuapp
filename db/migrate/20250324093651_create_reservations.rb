class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :checkInDate
      t.datetime :checkOutDate
      t.integer :numberOfPeople
      t.integer :user_id

      t.timestamps
    end
  end
end
