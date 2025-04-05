class User < ApplicationRecord
  has_one_attached :user_icon
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
