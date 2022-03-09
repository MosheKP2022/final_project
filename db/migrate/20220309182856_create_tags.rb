class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :category
      t.string :sub_category
      t.integer :labeled_offerings_count

      t.timestamps
    end
  end
end
