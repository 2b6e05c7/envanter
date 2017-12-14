class AddWarrantyEndToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :warranty_end, :date
  end
end
