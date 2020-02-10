class DropBodyForeignKeyFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_index :products, :body_id
    remove_column :products, :body_id

  end
end
