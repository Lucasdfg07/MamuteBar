class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :products, array: true, default: []
      t.string :owner
      t.integer :quantity, array: true, default: []
      t.integer :table
      t.string :payment
      t.string :status, default: 'opened'

      t.timestamps
    end
  end
end
