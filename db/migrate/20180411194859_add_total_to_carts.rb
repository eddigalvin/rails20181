class AddTotalToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :carttotal, :decimal, default: 0.0
  end
end
