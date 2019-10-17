# Spree::OrderContents.class_eval do
#   def add(variant, quantity = 1, options = {}, custom_style_id = nil)
#     timestamp = Time.current
#     line_item = add_to_line_item(variant, quantity, options, custom_style_id)
#     options[:line_item_created] = true if timestamp <= line_item.created_at
#     after_add_or_remove(line_item, options)
#   end
#
#   def add_to_line_item(variant, quantity, options = {}, custom_style_id = nil)
#     line_item = grab_line_item_by_variant(variant, false, options)
#
#     if line_item
#       line_item.quantity += quantity.to_i
#       line_item.currency = currency unless currency.nil?
#     else
#       opts = options.permit(Spree::PermittedAttributes.line_item_attributes).to_h
#                                          .merge(currency: order.currency)
#
#       line_item = order.line_items.new(quantity: quantity,
#                                        variant: variant,
#                                        custom_style_id: custom_style_id,
#                                        options: opts)
#     end
#     line_item.target_shipment = options[:shipment] if options.key? :shipment
#     line_item.save!
#     line_item
#   end
# end


before_action :clean_image_association, only: %i[create update]

# Rails adds a new image association with the correct information on assigning @object attributes. @object.images.build is necessary for the image form to render, generating a blank image record for the object that we delete here. Open to suggestions so that we wouldn't need this workaround.
def clean_image_association
  img = @object.images.first
  # @object.images.delete(img) unless img.valid?
end
