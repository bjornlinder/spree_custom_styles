Spree::Variant.class_eval do
  def check_price
    if price.nil?
      self.price = self == product.master ? product.price : product.master.price
    end
    if price.present? && currency.nil?
      self.currency = Spree::Config[:currency]
    end
  end
end
