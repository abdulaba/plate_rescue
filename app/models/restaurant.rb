class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :plates
  has_one_attached :photo
end
