class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  
  validates :title, presence: true
  validates :category, presence: true
  validates :name, presence: true
  validates :creation_date, presence: true
  validates :price, presence: true
end
