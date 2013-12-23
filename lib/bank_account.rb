class BankAccount
	attr_reader :balance

	RECORDS = File.basename(Dir.getwd)

	def initialize(args = {})
		@balance = args[:balance]
	end

	def deposit(amount)
		@balance += amount
	end

	def withdraw(amount)
		if amount > balance
			raise "Insufficient funds"
		else
			@balance -= amount
		end
	end

	def update(stock)
		File.open(RECORDS, 'a') do |file|
			file.write(
				"Balance is #{self.balance} as of #{Time.now} after transaction with: #{stock.ticker}"
				)
		end
	end

end