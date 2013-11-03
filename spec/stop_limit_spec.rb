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
			class Stock
				include StopLimit
			end
		}.to raise_error
	end



	it "can be included when class has price attribute" do 
		expect {
			class Stock
				attr_accessor :price

				include StopLimit
			end
		}.not_to raise_error
	end

	describe "#controlled_buy=" do
		let(:stock) {
			class Stock
				attr_accessor :price

				include StopLimit
			end
			Stock.new
		} 

		it "sets the buy price" do 
			stock.controlled_buy = 100.00
			stock.price.should eq(100.00)
		end

		it "sets the sale price" do 
			stock.controlled_buy = 100.00
			stock.sale_price.should eq(90.00)
		end

	end

	describe "sale_price attribute" do 
		let(:stock) {
			class Stock
				attr_accessor :price

				include StopLimit
			end
			Stock.new
		}

		# it "should dynamically create sale_price attribute when price is set" do 
		# 	stock.controller_buy_price = 100.00
		# 	stock.should respond_to(:sale_price)
		# end

		# it "sets the sale price when the price is set" do 
		# 	stock.price = 100.00
		# 	stock.sale_price.should eq(90.00)
		# end

		# it "returns a sale price a certain percentage below price" do 
		# 	stock.sale_price
		# end

	end
	# it "generates a sale price whenever the price is set" do 
	# 	let(:stock) {
	# 		class Stock
	# 			attr_accessor :price

	# 			include StopLimit
	# 		end
	# 		stock = Stock.new
	# 	}

	# 	stock.should_receive(:sale_price=).and_return(self.price - 10.00)

	# end

	# describe "#sell" do 
	# 	let(:stock) {
	# 		class Stock
	# 			attr_accessor :price

	# 			include StopLimit
	# 		end
	# 		s = Stock.new
	# 		s.price = 100.00
	# 	}


	# end


	# describe '#stop_limit' do 
	# 	let(:stock) {
	# 		class Stock
	# 			attr_accessor :price

	# 			include StopLimit
	# 		end
	# 		stock = Stock.new
	# 		stock.price = 100.00
	# 		stock
	# 	}

	# 	it "should respond to stop_limit" do 
	# 		stock.should respond_to(:stop_limit)
	# 	end

	# 	it "sets default sale price to -10%" do 
	# 		stock.stop_limit
	# 		stock.sale_price.should eq(90.00)
	# 	end
	# end

	# describe '.stock_attributes' do 
	# 	let(:stock) {
	# 		class Stock
	# 			attr_accessor :price
	# 			include StopLimit
	# 			stock_attributes
	# 		end

	# 		Stock.new
	# 	}

	# 	it 'should have a price' do 
	# 		stock.should respond_to(:price)
	# 	end

	# end

end