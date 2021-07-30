class CreateWalletEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_events do |t|
      t.string :type, null: false
      t.integer :wallet_id, null: false

      t.text :data, null: false
      t.text :metadata, null: false
      t.datetime :created_at, null: false

      t.index :wallet_id
    end
  end
end
