class AddPaymentMethodClassToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_method_class, :string
  end
end
