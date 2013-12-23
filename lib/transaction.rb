require 'observer'
class Transaction
	include Observable


	def execute
    raise "Execute method not implemented."
	end


end