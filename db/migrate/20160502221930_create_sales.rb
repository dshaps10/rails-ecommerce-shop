class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :product_id
      t.integer :buyer_id
      t.integer :quantity
      t.float :total_amount
      t.timestamps null: false
    end
  end
end
