class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :facility_images
  validates :facility_name, presence: true
  validates :facility_details, presence: true
  validates :facility_fee, presence: true, numericality: true, length: { minimum: 1 }
  validates :facility_address, presence: true
end
