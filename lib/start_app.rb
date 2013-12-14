require_relative 'bank_account'
require_relative 'transaction'
require_relative 'purchase'
require_relative 'sale'
require_relative 'portfolio'
require_relative 'stock'


portfolio = Portfolio.new('conservative')
bank_account = BankAccount.new(10000.00)
portfolio.add_bank_account(bank_account)

def stock_price_feed(stock)
	while true
		sleep 5
		stock.get_price
	end
end

if __FILE__ == $0
	puts "Enter ticker symbol:"
	symbol = gets.strip

	stock = Stock.new(symbol)

	Thread.new(stock_price_feed(stock)).join

	
end