module Spree
  module Admin
    class GiftOrderSettingsController < Spree::Admin::BaseController
      def edit; end

      def update
        SpreeGiftOrder::Config.set(params[:preferences])
        redirect_to edit_admin_gift_order_settings_path
      end
    end
  end
end
