class Purchase < Transaction
	attr_reader :shares

	def initialize(stock, shares, bank_account)
		super(stock, bank_account)
		@shares = shares
	end

	def execute
		@bank_account.withdraw(@stock.price * @shares)
	end

end