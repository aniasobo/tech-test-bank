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
    @history.save_credit(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @history.save_debit(amount, @balance)
  end

  def account_statement
    puts @history.print_statement
  end
end
