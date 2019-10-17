Spree::OrdersController.class_eval do
  def edit
    @order = current_order || Spree::Order.incomplete
                                          .includes(line_items: [variant: %i[images option_values product]])
                                          .find_or_initialize_by(token: cookies.signed[:token])
    associate_user
  end

  def populate
    order           = current_order(create_order_if_necessary: true)
    variant         = Spree::Variant.find(params[:variant_id])
    custom_style_id = params[:product_id].to_i
    quantity        = params[:quantity].to_i
    options         = params[:options] || {}

    # 2,147,483,647 is crazy. See issue #2695.
    if quantity.between?(1, 2_147_483_647)
      begin
        order.contents.add(variant, quantity, options, custom_style_id)
        order.update_line_item_prices!
        order.create_tax_charge!
        order.update_with_updater!
      rescue ActiveRecord::RecordInvalid => e
        error = e.record.errors.full_messages.join(', ')
      end
    else
      error = Spree.t(:please_enter_reasonable_quantity)
    end

    if error
      flash[:error] = error
      redirect_back_or_default(spree.root_path)
    else
      respond_with(order) do |format|
        format.html { redirect_to cart_path }
      end
    end
  end
end
