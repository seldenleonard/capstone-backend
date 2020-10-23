class CreateColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :abbreviation
      t.string :city
      t.string :state
      t.text :bio
      t.string :image_url

      t.timestamps
    end
  end
end
