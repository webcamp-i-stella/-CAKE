class CreateOderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oder_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :order_count
      t.integer :tax_price
      t.integer :production_status, default: 0

      t.timestamps
    end
  end
end
