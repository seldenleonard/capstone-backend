class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :name, length: { in: 2..30 }
  validates :artist, presence: true, 
  validates :artist, inclusion: { in: [true, false] }
  validates :artist, exclusion: { in: [nil] }
  validates :bio, length: { maximum: 600 }
  validates :art_style, length: { maximum: 50 }
  validates :major, length: { maximum: 30 }
  validates :minor, length: { maximum: 30 }
  validates :graduation_year, length: { is: 4 }
  validates :college_id, presence: true, unless: :is_not_artist

  def is_not_artist
    artist == "false"
  end

  has_many :artworks
  has_many :upvotes
  belongs_to :college, optional: true
  has_many :upvoted_artworks, through: :upvotes, source: :artwork

end