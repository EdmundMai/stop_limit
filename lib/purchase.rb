class Purchase < Transaction
	attr_reader :stock, :shares, :bank_account, :buy_price

	def initialize(stock, shares, bank_account)
		@stock = stock
		@bank_account = bank_account
		@shares = shares
	end

	def execute
		bank_account.withdraw(stock.price * shares)
		@buy_price = stock.price
	end

end