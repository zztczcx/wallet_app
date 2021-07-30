class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.string :name
      t.decimal :balance, precision: 10, scale: 2
      t.decimal :credit, precision: 10, scale: 2
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
