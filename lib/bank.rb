require 'date_helper'

class Bank

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance.to_f
    @history = [["date || credit || debit || balance"]]
    save_to_history
  end

  def print_balance
    add_trailing_zeroes(@balance)
  end

  def deposit(amount)
    @balance += amount
    save_to_history(credit: add_trailing_zeroes(amount))
  end

  def withdraw(amount)
    @balance -= amount
    save_to_history(debit: add_trailing_zeroes(amount))
  end

  def print_statement
    @history.join("\n")
  end

  private

  def save_to_history(credit: nil, debit: nil) 
    statement_line = []
    # adding day's date
    statement_line << Today.print_formatted
    # adding credit
    statement_line << credit == nil ? '' : credit
    # adding debit
    statement_line << debit == nil ? '' : debit
    # adding day's balance
    statement_line << print_balance
    # adding formatted line
    @history << statement_line.join(' || ')
  end

  def add_trailing_zeroes(num)
    '%.2f' % num
  end


end
