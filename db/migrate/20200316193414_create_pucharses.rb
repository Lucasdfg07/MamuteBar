class CreatePucharses < ActiveRecord::Migration[5.0]
  def change
    create_table :pucharses do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
