class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :salesTax
      t.decimal :shippingFee
      t.decimal :total
      t.string :methodOfPayment

      t.timestamps
    end
  end
end
