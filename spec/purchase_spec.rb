require 'spec_helper'


describe Purchase do 

	describe "#initialize" do
		let(:purchase) {
			stock = double('Stock', price: 10)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
		}
		it 'sets the stock' do
			stock = double('Stock', price: 10)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
			purchase.stock.should eq(stock)
		end

		it 'sets the bank account' do
			stock = double('Stock', price: 10)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
			purchase.bank_account.should eq(bank_account)
		end

		it 'sets the shares' do
			stock = double('Stock', price: 10)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
			purchase.shares.should eq(100)
		end

	end

	describe "#execute" do
		it 'withdraws money from the bank account' do
			stock = double('Stock', price: 1)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
			bank_account.should_receive(:withdraw).with(stock.price * shares)
			purchase.execute
		end

		it 'sets the buy price' do
			stock = double('Stock', price: 1)
			bank_account = double('Bank Account')
			shares = 100
			purchase = Purchase.new(stock, shares, bank_account)
			bank_account.should_receive(:withdraw)
			purchase.execute
			purchase.buy_price.should == stock.price
		end
	end

end


