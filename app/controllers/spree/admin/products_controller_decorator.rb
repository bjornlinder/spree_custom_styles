Spree::ProductsController.class_eval do
  before_action :exclude_styles, only: :index

  private

  def exclude_styles
    @collection = @collection.without_styles
  end
end
