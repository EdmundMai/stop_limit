require 'spec_helper'

describe Stock do
	subject { Stock.new('AMZN')}
	it { should respond_to(:ticker) }
	it { should respond_to(:buy) }
	it { should respond_to(:sell) }
	it { should respond_to(:price) }
	it { should respond_to(:price=) }
	it { should respond_to(:buy_price) }


	describe "initializing new stock instance" do 
		it 'stores the ticker symbol' do 
			stock = Stock.new('AMZN')
			stock.ticker.should eq('AMZN')
		end
	end

	describe "#buy" do 
		let(:stock) { Stock.new('AMZN') }
		it 'stores a buy price attribute' do 
			stock.buy
			stock.buy_price.should_not be_nil
		end
	end

	describe "#sell" do 
		let(:stock) { Stock.new('AMZN') }
		it 'stores a sell price attribute' do 
			stock.sell
			stock.sell_price.should_not be_nil
		end
	end

end