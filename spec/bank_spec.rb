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
      expect(@bank.balance).to eq 0
    end

    it 'prints out empty statement' do
      days_date = Today.print_formatted
      expect(@bank.print_statement).to eq "date || credit || debit || balance\n#{days_date} ||  ||  || 0.0"
    end
  end

  context 'money in da bank' do
    before :each do
      @bank = Bank.new(100)
    end
  
    it 'launches with given balance which is a float' do
      expect(@bank.balance).to eq 100.0
      expect(@bank.balance).to be_instance_of(Float)
    end

    it 'increases balance by deposit amount' do
      @bank.deposit(100)
      expect(@bank.balance).to eq 200.0
    end

    it 'decreases balance by debit amount' do
      @bank.withdraw(30)
      expect(@bank.balance).to eq 70.0
      expect(@bank.balance).to be_instance_of(Float)
    end

    it 'keeps track of multiple transactions' do
      @bank.deposit(2000)
      @bank.deposit(15555)
      @bank.withdraw(3)
      expect(@bank.balance).to eq 17652.0
    end
  end
end
