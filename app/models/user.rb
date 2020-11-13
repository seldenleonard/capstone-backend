class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :update }
  # -- trying to have email include .edu or maybe a list of @usc.edu, @nyu.edu, @utau.edu, and @umich.edu?
  validates :name, presence: true
  validates :name, length: { in: 2..30 }
  # validates :artist, presence: true # -- Probably dont need because a checkbox will make it unneccesary on frontend
  validates :artist, inclusion: { in: [true, false] } # this is not stopping random words from being entered into the artist params in User create
  # validates :artist, exclusion: { in: [nil] }
  # validates :artist, default: false
  validates :bio, length: { maximum: 600 }, if: :is_artist?
  validates :art_style, length: { maximum: 50 }, if: :is_artist?
  validates :major, presence: true, if: :is_artist?
  validates :major, length: { maximum: 30 }, if: :is_artist?
  validates :minor, length: { maximum: 30 }, if: :is_artist?
  # validates :graduation_year, presence: true ------ need to make this for artists only -- can do this on frontend
  validates :graduation_year, length: { is: 4 }, if: :is_artist?
  validates :college_id, presence: true, if: :is_artist?
  
  def is_artist?
    artist
  end

  has_many :artworks
  has_many :upvotes
  belongs_to :college, optional: true
  has_many :upvoted_artworks, through: :upvotes, source: :artwork

end