Spree::Order.class_eval do
  attr_accessible :gift, :gift_to, :gift_from, :gift_note

  before_save :update_gift_adjustment, if: :gift_changed?

  private

  def gift_changed?
    changed_attributes.has_key? 'gift'
  end

  def update_gift_adjustment
    Spree::GiftUpdater.new(self).update!
  end
end
