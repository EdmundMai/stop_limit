class Stock
	attr_accessor :price
	attr_reader :buy_price, :sell_price, :ticker

	def initialize(ticker)
		@ticker = ticker
	end

	def buy
		@buy_price = 'something'
	end

	def sell
		@sell_price = 'something'
	end


end