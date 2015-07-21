class OrdersController < ApplicationController
  def index
    load_orders
  end

  private

  def load_orders
    @orders = Order.all
  end
end
