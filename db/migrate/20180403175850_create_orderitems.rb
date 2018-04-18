class CreateOrderitems < ActiveRecord::Migration[5.1]
  def change
    create_table :orderitems do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
