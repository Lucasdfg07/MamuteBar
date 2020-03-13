class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.integer :table
      t.integer :table_unique, default: '0'
      t.string :status, default: 'opened'

      t.timestamps
    end
  end
end
