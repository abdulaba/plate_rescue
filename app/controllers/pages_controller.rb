class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cart = current_user&.cart
    @restaurants = Restaurant.limit(8).shuffle
    @reviews = Review.limit(3).shuffle
    render :home
  end
end
