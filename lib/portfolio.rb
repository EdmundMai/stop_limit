class Portfolio
	attr_accessor :name
	attr_reader :bank_accounts, :transactions

	def initialize(name)
		@name = name
		@bank_accounts = []
		@transactions = []
	end

	def add_bank_account(bank_account)
		@bank_accounts << bank_account
	end

	def add_transaction(transaction)
		@transactions << transaction
	end

	def execute_pending_transactions!
		transactions.each { |transaction| transaction.execute }
		@transactions = []
	end


end