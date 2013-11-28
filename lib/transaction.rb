class Transaction
	include Observable

	attr_reader :stock, :bank_account

	def initialize(stock, bank_account)
		@stock = stock
		@bank_account = bank_account
	end

	def execute
	end


end