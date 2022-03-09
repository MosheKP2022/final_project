class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :profile_picture
      t.string :first_name
      t.string :last_name
      t.text :about_me
      t.integer :phone
      t.string :address
      t.float :kids1_age
      t.float :kids2_age
      t.float :kids3_age
      t.float :kids4_age
      t.float :kids5_age
      t.float :kids6_age
      t.boolean :private
      t.integer :offerings_count
      t.integer :comments_count
      t.integer :messages_to_administrators_count

      t.timestamps
    end
  end
end
