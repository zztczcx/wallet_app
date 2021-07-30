class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
