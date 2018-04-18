class RenameNameToFname < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :fname
  end
end
