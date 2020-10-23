class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.integer :user_id
      t.string :title
      t.string :medium
      t.text :description
      t.integer :price
      t.string :dimensions
      t.integer :year

      t.timestamps
    end
  end
end
