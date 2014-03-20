class AddGiftColumnsToSpreeOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :gift, :boolean, default: false
    add_column :spree_orders, :gift_from, :string
    add_column :spree_orders, :gift_to, :string
    add_column :spree_orders, :gift_note, :text
  end
end
