class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.string :type, null: false
      t.integer :user_id, null: false

      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :user_id
    end
  end
end
