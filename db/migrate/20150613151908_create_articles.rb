class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :barcode
      t.integer :stock
      t.decimal :price
      t.integer :package_size

      t.timestamps null: false
    end
  end
end
