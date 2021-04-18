class RenameOderDetailToOrderDetail < ActiveRecord::Migration[5.2]
  def change
    rename_table :oder_details, :order_details
  end
end
