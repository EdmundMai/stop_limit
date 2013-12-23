class Purchase < Transaction
	attr_reader :stock, :shares, :bank_account, :buy_price

	def initialize(args = {})
		@stock = args[:stock]
		@bank_account = args[:bank_account]
		@shares = args[:shares]
	end

	def execute
		bank_account.withdraw(stock.price * shares)
		@buy_price = stock.price
	end

end