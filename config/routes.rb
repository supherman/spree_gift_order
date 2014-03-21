Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :gift_order_settings, only: [:edit, :update]
  end
end
