class AddCustomStyleToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :spree_line_items, :custom_style, references: :products, index: true
  end
end
