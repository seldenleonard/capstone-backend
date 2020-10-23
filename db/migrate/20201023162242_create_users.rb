class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :artist
      t.text :bio
      t.string :art_style
      t.string :image_url
      t.integer :college_id
      t.string :major
      t.string :minor
      t.integer :graduation_year

      t.timestamps
    end
  end
end
