class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :checkInDate, presence: true
  validates :checkOutDate, presence: true
  validates :numberOfPeople, presence: true, length: { minimum: 1 }
  validate :checkIn_checkOut_check
  validate :checkIn_today_check
  
  def checkIn_checkOut_check
    if checkInDate.present? && checkOutDate.present? && checkInDate > checkOutDate
      errors.add(:checkOutDate, "はチェックイン日より前の日付を指定してください。")
    end
  end
  
  def checkIn_today_check
    if checkInDate.present? && checkOutDate.present? && checkInDate < Date.today
      errors.add(:checkInDate, "は本日以降の日付を指定してください。")
    end
  end
  
end
