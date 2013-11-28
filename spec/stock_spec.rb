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

	describe "#get_price" do
		it 'grabs the price from the yahoo api' do 
			stock = Stock.new('AMZN')
			doc = Nokogiri::HTML(open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22#{stock.ticker}%22%29%0A%09%09&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"))
			data = JSON.parse(doc.content)
			price = data['query']['results']['quote']['Ask'].to_f
			stock.get_price.should eq(price)
		end
	end

end