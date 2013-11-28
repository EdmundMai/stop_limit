require 'spec_helper'

describe Stock do
	subject { Stock.new('AMZN')}
	it { should respond_to(:ticker) }
	it { should respond_to(:price) }

	describe "#initialize" do 
		it 'stores the ticker symbol' do 
			stock = Stock.new('AMZN')
			stock.ticker.should eq('AMZN')
		end
	end


end