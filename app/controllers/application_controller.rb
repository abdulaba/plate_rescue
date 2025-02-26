class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_cart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
