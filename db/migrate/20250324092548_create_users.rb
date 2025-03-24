class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confirmationPassword
      t.string :introduce

      t.timestamps
    end
  end
end
