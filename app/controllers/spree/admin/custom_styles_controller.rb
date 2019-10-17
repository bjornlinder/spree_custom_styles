require 'aws-sdk-s3'
module Spree
  module Admin
    class CustomStylesController < ResourceController
      belongs_to 'spree/custom_styles', find_by: :slug
      before_action :load_data, only: %i[new create edit update]

      # override the destroy method to set deleted_at value
      # instead of actually deleting the product.
      def destroy
        @custom_style = CustomStyle.friendly.find(params[:id])
        # Using delete instead of destroy to skip product callbacks; clearing images here is optional.
        if @custom_style.images.destroy_all && @custom_style.delete
          flash[:success] = Spree.t('notice_messages.custom_style_deleted')
        else
          flash[:error] = Spree.t('notice_messages.custom_style_not_deleted')
        end

        respond_with(@custom_style) do |format|
          format.html { redirect_to admin_product_custom_styles_url(params[:product_id]) }
          format.js { render_js_for_destroy }
        end
      end

      protected

      def parent
        @product = Product.with_deleted.friendly.find(params[:product_id])
      end

      def collection
        @deleted = params.key?(:deleted) && params[:deleted] == 'on' ? 'checked' : ''

        @collection ||=
          if @deleted.blank?
            parent.custom_styles
          else
            Product.only_deleted.where(master_product_id: parent.id)
          end
        @search = @collection.ransack
        @collection = @search.result
                             .page(params[:page])
                             .per(params[:per_page] ||
                      Spree::Config[:admin_products_per_page])
      end

      def find_resource
        if parent_data.present?
          parent.send(controller_name).friendly.find(params[:id])
        else
          model_class.find(params[:id])
        end
      end

      private

      def load_data
        @image = @object.images.first || @object.images.build
      end

      def permitted_resource_params
        params.require(:custom_style).permit('name', 'id', 'slug', 'description', images_attributes: %i[alt attachment id])
      end
    end
  end
end
