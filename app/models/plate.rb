class Plate < ApplicationRecord
  belongs_to :restaurant
  has_one_attached :photo
  has_and_belongs_to_many :categories
  has_many :category_plates, dependent: :destroy
  has_many :selected_plates, class_name: 'Selectedplate', dependent: :destroy
end
