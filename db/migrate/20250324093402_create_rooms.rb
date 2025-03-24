class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :area
      t.string :freeWord
      t.integer :user_id

      t.timestamps
    end
  end
end
