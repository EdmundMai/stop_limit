require 'spec_helper'

describe Sale do

	describe "#initialize" do
		it 'sets the sale price' do
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			sale.sale_price.should eq(300)
		end

		it 'sets the purchase' do
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			sale.purchase.should eq(purchase)
		end

		it 'sets the sale shares' do
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			sale.shares.should eq(sale_shares)
		end

		it 'sets the sale shares' do
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			sale.bank_account.should eq(bank_account)
		end
	end

	describe "#investment_return" do
		it 'calculates unrealized capital gains/losses' do 
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			sale.investment_return.should == ((sale.sale_price * sale.shares) - (purchase.buy_price * purchase.shares))
		end
	end

	describe "#execute" do
		it 'deposits money to the bank account' do
			purchase = double('Purchase', buy_price: 200.00, shares: 1)
			sale_price = 300
			sale_shares = 1
			bank_account = double('Bank Account')
			sale = Sale.new(purchase, sale_price, sale_shares, bank_account)
			investment_return = (sale.sale_price * sale.shares) - (purchase.buy_price * purchase.shares)
			bank_account.should_receive(:deposit).with(investment_return)
			sale.execute
		end
	end


end