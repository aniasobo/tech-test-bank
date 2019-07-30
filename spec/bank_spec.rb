require 'bank'
require 'date_helper'

RSpec.describe Bank do
  context 'no money in the bank' do
    before :each do
      @bank = Bank.new
    end

    it 'launches in an empty state' do
      expect(@bank).to be_a(Bank)
    end

    it 'launches with default balance of none' do
      expect(@bank.print_balance).to eq "0.00"
    end

    it 'prints out empty statement' do
      days_date = Today.print_formatted
      expect(@bank.print_statement).to eq "date || credit || debit || balance\n#{days_date} ||  ||  || 0.00"
    end
  end

  context 'money in da bank' do
    before :each do
      @bank = Bank.new(100)
      @days_date = Today.print_formatted
    end
  
    it 'launches with given balance which is formatted correctly' do
      expect(@bank.print_balance).to eq "100.00"
    end

    it 'increases balance by deposit amount' do
      @bank.deposit(100)
      expect(@bank.print_balance).to eq "200.00"
    end

    it 'decreases balance by debit amount' do
      @bank.withdraw(30)
      expect(@bank.print_balance).to eq "70.00"
    end

    it 'keeps track of multiple transactions' do
      @bank.deposit(2000)
      @bank.deposit(15555)
      @bank.withdraw(3)
      expect(@bank.print_balance).to eq "17652.00"
    end

    it 'prints a formatted statement with many transactions' do
      @bank.deposit(20)
      @bank.withdraw(3) # 117
      expect(@bank.print_statement).to eq "date || credit || debit || balance\n#{@days_date} ||  ||  || 100.00\n#{@days_date} || 20.00 ||  || 120.00\n#{@days_date} ||  || 3.00 || 117.00"
    end
  end
end
