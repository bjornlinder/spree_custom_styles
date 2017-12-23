module Spree
  class CustomStyle < Spree::Product
    has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: 'Spree::Image'
    accepts_nested_attributes_for :images,
                                  reject_if: ->(i) { i[:attachment].blank? }
    belongs_to :master_product, touch: true, class_name: 'Spree::Product', inverse_of: :custom_styles
    has_many :variants, through: :master_product
    has_many :variants_including_master, through: :master_product
    has_many :product_option_types, through: :master_product
    has_many :product_properties, through: :master_product
    has_many :properties, through: :product_properties
    has_many :option_types, through: :product_option_types
    has_many :prices, through: :master_product
    has_many :taxons, through: :master_product

    delegate :price, :master, :currency, :display_amount,
             :display_price, :weight,
             to: :master_product

    # Spree::CustomStyle.all gives only custom styles by default;
    # Spree::Product.all will not return any custom styles.
    # Unscope also clears the deleted_at default scope.
    default_scope { unscope(:where).where.not master_product_id: nil }
    scope :with_styles, -> { unscope(:where) }

    # http://stackoverflow.com/a/14615233 removing presence validations from Spree models

    _validators.reject! { |key, _| %i[price shipping_category].include? key }

    _validate_callbacks.each do |callback|
      if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
        callback.raw_filter.attributes.delete :price
        callback.raw_filter.attributes.delete :shipping_category
      end
    end
  end
end
