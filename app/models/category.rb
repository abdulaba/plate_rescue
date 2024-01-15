class Category < ApplicationRecord
  has_many :category_plates
  has_many :plates, through: :category_plates, dependent: :destroy
  has_one_attached :photo
end
