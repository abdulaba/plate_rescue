class Plate < ApplicationRecord
  belongs_to :restaurant
  has_one_attached :photo
  has_many :category_plates
  has_many :categories, through: :category_plates, dependent: :destroy
end
