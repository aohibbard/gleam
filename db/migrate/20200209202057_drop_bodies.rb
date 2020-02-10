class DropBodies < ActiveRecord::Migration[6.0]
  def change
    drop_table :bodies
  end
end
