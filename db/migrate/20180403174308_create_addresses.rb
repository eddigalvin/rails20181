class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address1
      t.string :address2
      t.string :town
      t.string :county
      t.string :country

      t.timestamps
    end
  end
end
