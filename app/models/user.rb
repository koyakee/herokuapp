class User < ApplicationRecord
  has_one_attached :user_icon
  has_many :rooms
  has_many :reservations
  validates :name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
