class College < ApplicationRecord

  validates :name, presence: true
  validates :abbreviation, presence: true
  validates :abbreviation, length: { maximum: 15 }
  validates :city, presence: true
  validates :state, presence: true
  validates :state, length: { is: 2 }
  validates :bio, presence: true
  validates :bio, length: { in: 30..200 }
  validates :image_url, presence: true

  has_many :users

end