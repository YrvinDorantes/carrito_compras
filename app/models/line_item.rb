class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  delegate :name, to: :product
  delegate :description, to: :product
end
