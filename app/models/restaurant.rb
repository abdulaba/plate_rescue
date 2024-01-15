class Restaurant < ApplicationRecord
 # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user; has_many :plates, dependent: :destroy; has_one_attached :photo
  has_many :reviews
  validates :name, presence: true, length: { maximum: 100}
  validates :address, presence: true
  validates :user, presence: true
  validates :opening_date, presence: true
  validates :opening_time, presence: true
end
