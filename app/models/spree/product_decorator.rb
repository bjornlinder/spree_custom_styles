Spree::Product.class_eval do
  has_many :custom_styles, inverse_of: :master_product, dependent: :destroy, foreign_key: 'master_product_id'
  belongs_to :master_product, touch: true, class_name: 'Spree::Product', inverse_of: :custom_styles

  def has_custom_styles?
    custom_styles.any?
  end
end
