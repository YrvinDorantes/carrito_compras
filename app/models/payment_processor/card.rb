class PaymentProcessor::Card
	include ActiveModel::Validations

	attr_reader :order, :response, :source_params

	def initialize(args = {})
		@order = args[:order]
		@source_params = args[:source_params]
	end

	def charge
		begin
			@response = Conekta::Charge.create(charge_params)
			true
		rescue Conekta::ParameterValidationError => e
			errors.add(:base, e.message_to_purchaser)
			false
		rescue Conekta::ProcessingError => e
			errors.add(:base, e.message_to_purchaser)
			false
		rescue Conekta::Error => e
			errors.add(:base, e.message_to_purchaser)
			false
		end
	end

	private

	def charge_params
		{
				amount: order.total_in_cents,
				currency: "MXN",
				description: "order #{order.number}",
				reference_id: order.number,
				card: source_params,
				details: {
					email: order.email,
					line_items: line_items_from_order
				}
		}
	end

	def line_items_from_order
		order.line_items.includes(:product).collect do |li|
			{
				name: li.name,
				description: li.description,
				unit_price: li.price_in_cents,
				quantity: li.quantity
			}
		end
	end
end