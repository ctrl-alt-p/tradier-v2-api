class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :slug
      t.string :symbol
      t.string :name
      t.text :description
      t.string :exchange
      t.string :sector
      t.string :sub_industry
      t.text :fundamentals
      t.text :quote

      t.timestamps null: false
    end
  end
end
