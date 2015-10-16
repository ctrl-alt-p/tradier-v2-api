class CreateStockIndices < ActiveRecord::Migration
  def change
    create_table :stock_indices do |t|
      t.string :slug
      t.string :name
      t.text :description
      t.text :symbols

      t.timestamps null: false
    end
  end
end
