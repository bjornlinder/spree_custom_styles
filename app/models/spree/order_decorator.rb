Spree::Order.class_eval do
  has_many :custom_styles, through: :line_items
end
