require 'bank'
require 'date_helper'

RSpec.describe Bank do 
  context 'no money in the bank' do
    before(:each) do
      statement = class_double("Statement")
      allow(statement).to receive(:begin_history).with(any_args).and_return(true)
      allow(statement).to receive(:save_credit).with(any_args).and_return(true)
      allow(statement).to receive(:save_debit).with(any_args).and_return(true)
      allow(statement).to receive(:print_statement).and_return("your statement")
      @bank = Bank.new(0, statement)
    end

    it 'accepts deposits' do
      expect(@bank.deposit(10)).to be_truthy
      expect(@bank.balance).to eq(10)
    end

    it 'computes withdrawals' do
      @bank.deposit(10)
      expect(@bank.withdraw(1)).to be_truthy
      expect(@bank.balance).to eq(9)
    end

    it 'prints statement' do
      expect do
        @bank.account_statement
      end.to output("your statement\n").to_stdout
    end

    xit 'throws error at withdrawal attempts'
  end

  context "money in the bank" do
    before(:each) do
      statement = class_double("Statement")
      allow(statement).to receive(:begin_history).with(any_args).and_return(true)
      allow(statement).to receive(:save_credit).with(any_args).and_return(true)
      allow(statement).to receive(:save_debit).with(any_args).and_return(true)
      allow(statement).to receive(:print_statement).and_return("your statement")
      @bank = Bank.new(10, statement)
    end

    it 'accepts deposits' do
      expect(@bank.deposit(10)).to be_truthy
      expect(@bank.balance).to eq(20)
    end

    it 'computes withdrawals' do
      expect(@bank.withdraw(1)).to be_truthy
      expect(@bank.balance).to eq(9)
    end
    
    xit 'throws error at attempts to exceed balance zero'
  end
end
