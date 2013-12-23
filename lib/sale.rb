class Sale < Transaction
	attr_reader :sale_price, :purchase, :shares, :bank_account

	def initialize(args = {})
		@sale_price = args[:sale_price]
		@shares = args[:sale_shares]
		@purchase = args[:purchase]
		@bank_account = args[:bank_account]
	end

	def execute
		bank_account.deposit(investment_return)
	end

	def investment_return
		(sale_price * shares) - (purchase.buy_price * purchase.shares)
	end

end