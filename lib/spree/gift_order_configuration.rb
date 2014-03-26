module Spree
  class GiftOrderConfiguration < Preferences::Configuration
    preference :create_adjustment, :boolean, default: false
    preference :adjustment_amount, :decimal, default: 0
    preference :adjustment_label, :string, default: Spree.t(:gift_adjustment_label)
    preference :adjustment_advice, :string, default: ''
    preference :description, :string, default: ''
  end
end
