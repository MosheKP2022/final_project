class CreateLabeledOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :labeled_offerings do |t|
      t.integer :offering_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
