class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :offering_id
      t.text :body
      t.boolean :private

      t.timestamps
    end
  end
end
