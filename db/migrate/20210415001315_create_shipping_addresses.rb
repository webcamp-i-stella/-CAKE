class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
