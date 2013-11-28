require 'spec_helper'

describe StopLimit do

	it "has default stop limit percentage" do 
		StopLimit::DEFAULT_STOP_LIMIT_PERCENTAGE.should_not be_nil
	end

	it "defaults to a -10% stop limit strategy" do 
		StopLimit::DEFAULT_STOP_LIMIT_PERCENTAGE.should eq(10)
	end 

	it "can't be included when class doesn't have price attribute" do
		expect {
			class StockMock
				include StopLimit
			end
		}.to raise_exception
	end



	it "can be included when class has price attribute" do 
		expect {
			class StockMock
				attr_accessor :price

				include StopLimit
			end
		}.not_to raise_error
	end

	describe "#controlled_buy=" do
		let(:stock) {
			class StockMock
				attr_accessor :price

				include StopLimit
			end
			StockMock.new
		} 

		it "sets the buy price" do 
			stock.controlled_buy = 100.00
			stock.price.should eq(100.00)
		end

		it "sets the sale price" do 
			stock.controlled_buy = 100.00
			stock.forced_sale_price.should eq(90.00)
		end

	end
end