class Checkout < ApplicationRecord
  serialize :dish, JSON
  belongs_to :user
  belongs_to :restaurant
end
