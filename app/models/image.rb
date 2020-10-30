class Image < ApplicationRecord

  # validates :artwork_id, presence: true
  # validates :url, presence: true

  belongs_to :artwork

end