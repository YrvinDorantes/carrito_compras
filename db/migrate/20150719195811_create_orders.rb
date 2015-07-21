class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number, limit: 15
      t.decimal :total, precision: 8, scale: 2, default: 0.0, null: false
      t.integer :state, default: 0
      t.string :email
      t.datetime :completed_at

      t.timestamps null: false
    end

    add_index(:orders, :number, length: 15, unique: true)
    add_index(:orders, :email)
  end
end
