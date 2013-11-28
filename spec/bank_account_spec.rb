require 'spec_helper'

describe BankAccount do
	subject { BankAccount.new(2000) }
	it { should respond_to(:balance) }

	it "has a default file path" do
		BankAccount::RECORDS.should eq(File.basename(Dir.getwd))
	end

	describe "#initialize" do 
		it "sets the balance" do 
			bank_account = BankAccount.new(2000.00)
			bank_account.balance.should == 2000.00
		end
	end

	describe "#deposit" do 
		it "adds to the balance" do 
			bank_account = BankAccount.new(2000.00)
			bank_account.deposit(100.00)
			bank_account.balance.should == 2100.00
		end
	end

	describe "#withdraw" do
		it "subtracts from the balance" do 
			bank_account = BankAccount.new(2000.00)
			bank_account.withdraw(100.00)
			bank_account.balance.should == 1900.00
		end

		context "there is less money in the account than the amount withdrawn" do 
			it 'raises an exception' do
				bank_account = BankAccount.new(100.00)
				expect { bank_account.withdraw(200.00) }.to raise_exception
			end
		end
	end

	context "when the Observable module is included" do
		describe "#update" do
			after do 
				File.delete(BankAccount::RECORDS) if File.exist?(BankAccount::RECORDS)
			end
			it "prints to the records file" do
				stock = double('Stock')
				stock.stub(:ticker).and_return('AMZN')
				bank_account = BankAccount.new(2000.00)
				bank_account.update(stock)
				contents = File.read(BankAccount::RECORDS)
				contents.should include("Balance is #{bank_account.balance}")
				contents.should include("AMZN")
			end
		end

	end

end