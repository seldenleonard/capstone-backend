class College < ApplicationRecord

  has_many :users
  
  # I am adding these associations in so I can show some of the artists artworks in the CollegesShow.vue
  # has_many :artworks, through: :users
  # has_many :images, through: :users, source: :artworks

end