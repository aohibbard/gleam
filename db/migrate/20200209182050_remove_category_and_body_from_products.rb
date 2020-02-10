class RemoveCategoryAndBodyFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :category  
    remove_column :products, :body_part
  end
end
