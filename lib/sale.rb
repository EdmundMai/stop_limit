class Sale < Transaction
	attr_reader :sale_price, :purchase, :shares, :bank_account

	def initialize(purchase, sale_price, sale_shares, bank_account)
		@sale_price = sale_price
		@shares = sale_shares
		@purchase = purchase
		@bank_account = bank_account
	end

	def execute
		bank_account.deposit(investment_return)
	end

	def investment_return
		(sale_price * shares) - (purchase.buy_price * purchase.shares)
	end

end