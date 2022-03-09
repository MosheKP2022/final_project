class CreateOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :offerings do |t|
      t.string :title
      t.float :min_age
      t.text :description
      t.string :image
      t.string :address
      t.string :video
      t.integer :giver_id
      t.float :max_age
      t.float :price
      t.date :date
      t.time :time
      t.integer :comments_count
      t.integer :labeled_offerings_count

      t.timestamps
    end
  end
end
