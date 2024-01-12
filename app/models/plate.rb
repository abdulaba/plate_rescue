class Plate < ApplicationRecord
  belongs_to :restaurant
  has_one_attached :photo
  has_many :category_plates, dependent: :destroy
  has_many :categories, through: :category_plates
  has_many :selected_plates, class_name: 'Selectedplate', dependent: :destroy
end
