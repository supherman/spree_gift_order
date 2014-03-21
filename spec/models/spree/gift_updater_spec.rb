require 'spec_helper'

describe Spree::GiftUpdater do
  let(:order) { create(:order) }

  subject { described_class.new(order) }

  describe '#update!' do
    context 'When create gift adjustment is disabled' do
      before do
        SpreeGiftOrder::Config[:create_adjustment] = false
      end

      specify { expect{subject.update!}.to_not change{order.adjustments.size} }
    end

    context 'When create gift adjustment is enabled and gift is true' do
      before do
        SpreeGiftOrder::Config[:create_adjustment] = true
        SpreeGiftOrder::Config[:adjustment_amount] = 10
        SpreeGiftOrder::Config[:adjustment_label] = 'foo bar'
        order.gift = true
      end

      specify { expect{subject.update!}.to change{order.adjustments.size} }
    end

    context 'When create gift adjustment is enabled and gift is false and the order has a gift adjustment' do
      before do
        SpreeGiftOrder::Config[:create_adjustment] = true
        SpreeGiftOrder::Config[:adjustment_amount] = 10
        SpreeGiftOrder::Config[:adjustment_label] = 'foo bar'

        order.adjustments.create label: 'foo bar', amount: 10
        order.gift = false
      end

      specify { expect{subject.update!}.to change{order.adjustments.size}.by(-1) }
    end

    context 'When create gift adjustment is enabled and gift is false and the order does not has a gift adjustment' do
      before do
        SpreeGiftOrder::Config[:create_adjustment] = true
        SpreeGiftOrder::Config[:adjustment_amount] = 10
        SpreeGiftOrder::Config[:adjustment_label] = 'foo bar'
        order.gift = false
      end

      specify { expect{subject.update!}.to_not raise_error }
    end
  end
end
