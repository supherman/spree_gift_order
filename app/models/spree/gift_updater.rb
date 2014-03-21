module Spree
  class GiftUpdater
    attr_reader :order

    def initialize(order)
      @order = order
    end

    def update!
      return unless can_create_adjustment?
      if order.gift
        create_adjustment!
      else
        remove_adjustment!
      end
    end

    private

    def create_adjustment!
      remove_adjustment! if has_gift_adjustment?
      order.adjustments.create label: adjustment_label, amount: adjustment_amount
    end

    def remove_adjustment!
      order.adjustments.find_by_label(adjustment_label).try(:destroy)
    end

    def can_create_adjustment?
      SpreeGiftOrder::Config[:create_adjustment]
    end

    def adjustment_amount
      SpreeGiftOrder::Config[:adjustment_amount]
    end

    def adjustment_label
      SpreeGiftOrder::Config[:adjustment_label]
    end

    def has_gift_adjustment?
      !!order.adjustments.find_by_label(adjustment_label)
    end
  end
end
