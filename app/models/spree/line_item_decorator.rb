Spree::LineItem.class_eval do
  belongs_to :custom_style, class_name: 'Product'

  def name
    custom_style ? custom_style.name : variant.name
  end

  def description
    custom_style ? custom_style.description : variant.description
  end

  def product_style
    custom_style_id ? Spree::CustomStyle.find(custom_style_id) : variant.product
  end
end
