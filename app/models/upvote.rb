class Upvote < ApplicationRecord

# I dont need validations on foreign keys, because they are already required by rails

  validates :user_id, :uniqueness => { :scope => :artwork_id,
    :message => "You have already upvoted this artwork." }

  belongs_to :artwork
  belongs_to :user

end