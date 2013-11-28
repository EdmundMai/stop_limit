require 'spec_helper'

describe Portfolio do
	subject { Portfolio.new("Portfolio") }
	it { should respond_to(:bank_accounts)}

	describe "#initialize" do
		it "should set the name" do
			portfolio = Portfolio.new('Long Term')
			portfolio.name.should eq('Long Term')
		end

		it "should initialize bank accounts" do
			portfolio = Portfolio.new('Long Term')
			portfolio.bank_accounts.should be_empty
		end

		it "should initialize transactions" do
			portfolio = Portfolio.new('Long Term')
			portfolio.transactions.should be_empty
		end
	end

	describe "#add_bank_account" do
		it "should add a bank account" do
			portfolio = Portfolio.new('Long Term')
			portfolio.add_bank_account(double('Bank Account'))
			portfolio.bank_accounts.should_not be_nil
		end
	end

	describe "#add_transaction" do 
		it "should add a transaction to the cue" do
			portfolio = Portfolio.new('Long Term')
			portfolio.add_transaction(double('Transaction'))
			portfolio.transactions.should_not be_empty
		end
	end

	describe "#execute_pending_transactions!" do 
		it "should execute all of its transactions" do
			portfolio = Portfolio.new('Long Term')
			transaction = double('Transaction', execute: true)
			portfolio.add_transaction(transaction)
			transaction.should_receive(:execute)
			portfolio.execute_pending_transactions!
		end

		it "should empties all transactions" do
			portfolio = Portfolio.new('Long Term')
			transaction = double('Transaction', execute: true)
			portfolio.add_transaction(transaction)
			portfolio.execute_pending_transactions!
			portfolio.transactions.should be_empty
		end
	end


	# describe "#remove_bank_account" do
	# 	it "should remove a bank account" do
	# 		portfolio = Portfolio.new('Long Term')
	# 		portfolio.add_bank_account(double('Bank Account'))
	# 		portfolio.remove_bank_account(double('Bank Account'))
	# 		portfolio.bank_accounts.should be_nil
	# 	end
	# end

end