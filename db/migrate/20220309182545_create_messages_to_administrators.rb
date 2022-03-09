class CreateMessagesToAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :messages_to_administrators do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
