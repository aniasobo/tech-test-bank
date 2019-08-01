require 'bank'
require 'date_helper'

describe Bank do
  context 'no money in the bank' do
    before :each do
      @bank = Bank.new
      @days_date = Today.print_formatted
    end

    it 'launches in an empty state' do
      expect(@bank).to be_a(Bank)
    end

    it 'launches with default balance of none' do
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 0.00 || || 0.00\n").to_stdout
    end

    it 'prints out empty statement' do
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 0.00 || || 0.00\n").to_stdout
    end
  end

  context 'money in the bank' do
    before :each do
      @bank = Bank.new(100)
      @days_date = Today.print_formatted
    end
  
    it 'launches with given balance which is formatted correctly' do
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 100.00 || || 100.00\n").to_stdout
    end

    it 'increases balance by deposit amount' do
      @bank.deposit(100)
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 100.00 || || 100.00\n#{@days_date} || 100.00 || || 200.00\n").to_stdout
    end

    it 'decreases balance by debit amount' do
      @bank.withdraw(30)
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 100.00 || || 100.00\n#{@days_date} || || 30.00 || 70.00\n").to_stdout
    end

    it 'keeps track of multiple transactions' do
      @bank.deposit(2000)
      @bank.deposit(15555)
      @bank.withdraw(3)
      expect do
        @bank.account_statement
      end.to output(/17652.00/).to_stdout
    end

    it 'prints a formatted statement with many transactions' do
      @bank.deposit(20)
      @bank.withdraw(3)
      expect do
        @bank.account_statement
      end.to output("date || credit || debit || balance\n#{@days_date} || 100.00 || || 100.00\n#{@days_date} || 20.00 || || 120.00\n#{@days_date} || || 3.00 || 117.00\n").to_stdout    
    end
  end
end
