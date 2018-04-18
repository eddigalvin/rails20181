class AddCartIdToOrderitems < ActiveRecord::Migration[5.1]
  def change
    add_column :orderitems, :cart_id, :integer, default: 1
  end
end
