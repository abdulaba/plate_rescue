class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user; has_many :plates; has_one_attached :photo

  validates :name, presence: true, length: { maximum: 100}
  validates :address, presence: true
  validates :user, presence: true
  validates :opening_date, presence: true
  validates :opening_time, presence: true
end
