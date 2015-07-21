class AddPaymentLogToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_log, :json
  end
end
