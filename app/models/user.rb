class User < ApplicationRecord

  has_secure_password
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :update }
  validates :name, presence: true
  validates :name, length: { in: 2..50 }
  validates :artist, inclusion: { in: [true, false] }
  validates :bio, length: { maximum: 500 }, if: :is_artist?
  validates :art_style, length: { maximum: 50 }, if: :is_artist?
  validates :major, presence: true, if: :is_artist?
  validates :major, length: { maximum: 50 }, if: :is_artist?
  validates :minor, length: { maximum: 50 }, if: :is_artist?
  validates :graduation_year, length: { is: 4 }, if: :is_artist?
  validates :college_id, presence: true, if: :is_artist?

  def is_artist?
    artist
  end

  has_many :artworks, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  belongs_to :college, optional: true
  has_many :upvoted_artworks, through: :upvotes, source: :artwork

end