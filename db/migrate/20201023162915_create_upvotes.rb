class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.integer :artwork_id
      t.integer :user_id

      t.timestamps
    end
  end
end
