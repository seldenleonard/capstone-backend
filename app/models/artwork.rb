class Artwork < ApplicationRecord

  validates :title, presence: true
  validates :title, length: { in: 1..50 }
  validates :medium, presence: true
  validates :medium, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }
  validates :price, length: { maximum: 7 }
  validates :year, presence: true
  validates :year, length: { is: 4 }

  belongs_to :user
  has_many :images
  has_many :upvotes
  has_many :users, through: :upvotes

  # New addition with the ones in college.rb
  # belongs_to :college, through: :user

end