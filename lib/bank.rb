require_relative 'statement.rb'

class Bank

  attr_reader :balance

  def initialize(balance = 0, history = Statement)
    @balance = balance
    @history = history
    @history.begin_history(add_trailing_zeroes(@balance))
  end

  def deposit(amount)
    @balance += amount
    @history.save_to_history(credit: add_trailing_zeroes(amount), balance: add_trailing_zeroes(@balance))
  end

  def withdraw(amount)
    @balance -= amount
    @history.save_to_history(debit: add_trailing_zeroes(amount), balance: add_trailing_zeroes(@balance))
  end

  def account_statement
    puts @history.print_statement
  end

  private

  def add_trailing_zeroes(num)
    num.nil? ? num = "0.00" : ('%.2f' % num) 
  end

end
