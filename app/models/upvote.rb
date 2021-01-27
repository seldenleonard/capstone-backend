class Upvote < ApplicationRecord

# NOTE: No need for validations on foreign keys, because they are already required by Rails

  validates :user_id, :uniqueness => { :scope => :artwork_id,
    :message => "You have already upvoted this artwork." }

  belongs_to :artwork
  belongs_to :user

end