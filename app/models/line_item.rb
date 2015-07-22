class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  delegate :name, to: :product
  delegate :description, to: :product

  def price_in_cents
  	(price * 100).round
  end
end
