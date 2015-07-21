class Order < ActiveRecord::Base
  enum state: [:pending, :complete, :canceled]

  has_many :line_items

  accepts_nested_attributes_for :line_items

  validates :number, uniqueness: true

  before_save :calculate_total
  before_create :generate_unique_number


  def total_in_cents
    (total * 100).round
  end

  private

  def generate_unique_number
    self.number = loop do
      random_number = SecureRandom.urlsafe_base64(nil, false).slice(0..14)
      break random_number unless Order.exists?(number: random_number)
    end
  end

  def calculate_total
    self.total = line_items.collect { |li| li.quantity * li.price }.sum
  end
end
