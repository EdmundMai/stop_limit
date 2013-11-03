require "stop_limit/version"

module StopLimit
  
  DEFAULT_STOP_LIMIT_PERCENTAGE = 10

  def self.included(base)
  	if base.method_defined?(:price) && base.method_defined?(:price=)

  		def controlled_buy=(price)
  			self.send(:price=, price)
  			self.instance_variable_set(:@sale_price, price * (100-DEFAULT_STOP_LIMIT_PERCENTAGE)/100.to_f)
  		end

 			define_method("sale_price") do 
 				self.instance_variable_get("@sale_price")
  		end

	  else
	  	raise "#{base} must have price attribute before including #{self} module"
  	end
  end
end
