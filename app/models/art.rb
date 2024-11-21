class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, presence: true
  validates :category, presence: true
  validates :name, presence: true
  validates :creation_date, presence: true
  validates :price, presence: true
  validates :photo, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_all_attributes,
    against: [ :title, :category, :name, :creation_date ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
