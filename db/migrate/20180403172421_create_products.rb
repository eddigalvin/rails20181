class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :manu
      t.string :model
      t.text :desc
      t.string :procname
      t.integer :proc_id
      t.integer :memsize
      t.integer :mem_id
      t.string :hdtype
      t.integer :hdsize
      t.integer :hd_id
      t.string :osname
      t.integer :os_id
      t.decimal :vatprice
      t.string :image_url

      t.timestamps
    end
  end
end
