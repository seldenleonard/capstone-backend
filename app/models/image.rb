class Image < ApplicationRecord

  validates :url, presence: true

  belongs_to :artwork

  # New addition with the ones in college.rb and artwork.rb
  # belongs_to :college, through: :artwork

end