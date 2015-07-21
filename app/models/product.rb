class Product < ActiveRecord::Base
  has_many :line_items

  validates :name, :price, :currency, presence: true

  before_validation :set_default_currency

  private

  def set_default_currency
    return unless currency.blank?
    self.currency = "MXN"
  end
end
