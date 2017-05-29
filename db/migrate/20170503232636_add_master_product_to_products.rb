class AddMasterProductToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :spree_products, :master_product
  end
end
