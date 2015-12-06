class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.text :address
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
