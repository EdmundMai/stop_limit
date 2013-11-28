require 'spec_helper'

describe BankAccount do
	subject { BankAccount.new(2000) }
	it { should respond_to(:balance) }

	describe "#init" do 
		it "adds to the balance" do 
			bank_account = BankAccount.new(2000)
			bank_account.balance.should == 2000
		end

	end

end