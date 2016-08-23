class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.references :product
      t.timestamps
    end
  end
end
