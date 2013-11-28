require "nokogiri"
require "open-uri"
require "json"
class Stock
	attr_accessor :price
	attr_reader :ticker

	YAHOO_QUOTES_API = 

	def initialize(ticker)
		@ticker = ticker
	end

	def get_price
		doc = Nokogiri::HTML(open("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22#{self.ticker}%22%29%0A%09%09&env=http%3A%2F%2Fdatatables.org%2Falltables.env&format=json"))
		data = JSON.parse(doc.content)
		begin
			return data['query']['results']['quote']['Ask'].to_f
		rescue
			raise 'Connection to Yahoo API unavailable.'
		end
	end

end