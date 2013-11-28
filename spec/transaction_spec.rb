require 'spec_helper'

describe Transaction do

	describe "#initialize" do
		it 'sets the stock' do
			stock = double('Stock')
			bank_account = double('Bank Account')
			transaction = Transaction.new(stock, bank_account)
			transaction.stock.should eq(stock)
		end

		it 'sets the bank account' do
			stock = double('Stock')
			bank_account = double('Bank Account')
			transaction = Transaction.new(stock, bank_account)
			transaction.bank_account.should eq(bank_account)
		end
	end


end