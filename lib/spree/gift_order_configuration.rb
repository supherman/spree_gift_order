module Spree
  class GiftOrderConfiguration < Preferences::Configuration
    preference :create_adjustment, :boolean, default: false
    preference :adjustment_amount, :decimal, default: 0
  end
end
