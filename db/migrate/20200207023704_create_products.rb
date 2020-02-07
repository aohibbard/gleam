class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :manufacturer_id
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :price
      t.string :category
      t.string :body_part

      t.timestamps
    end
  end
end
