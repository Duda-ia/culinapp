class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos, dependent: :destroy

  has_many :journeys
  has_many :paths, through: :journeys
  has_one :profile, dependent: :destroy
  has_many :reviews
  has_many :questions

end
