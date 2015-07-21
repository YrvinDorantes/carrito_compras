class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2, null: false, default: 0.0
      t.string :currency, default: "MXN"

      t.timestamps null: false
    end
  end
end
