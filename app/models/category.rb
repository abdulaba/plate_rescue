class Category < ApplicationRecord
  has_many :plates
  has_many :plates, through: :category_plates, dependent: :destroy
end
