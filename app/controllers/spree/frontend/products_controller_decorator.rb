Spree::ProductsController.class_eval do
  after_action :check_if_custom_style, only: :load_product

  private

  def check_if_custom_style
    @product = @product.becomes(Spree::CustomStyle) if @product.master_product_id
  end
end
