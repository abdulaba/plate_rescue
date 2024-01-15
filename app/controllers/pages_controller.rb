class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cart = current_user.cart
    render :home
  end
end
