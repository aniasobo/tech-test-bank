require_relative 'statement.rb'

class Bank

  attr_reader :balance

  def initialize(balance = 0, history = Statement)
    @balance = balance
    @history = history
    @history.begin_history(@balance)
  end

  def deposit(amount)
    @balance += amount
    @history.save_to_history(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @history.save_to_history(debit: amount, balance: @balance)
  end

  def account_statement
    puts @history.print_statement
  end
end
