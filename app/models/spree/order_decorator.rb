Spree::Order.class_eval do
  attr_accessible :gift, :gift_to, :gift_from, :gift_note
end
