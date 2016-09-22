class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.decimal :price
      t.integer :venue_id
      t.integer :category_id
      t.timestamps
    end
  end
end
