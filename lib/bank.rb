require 'date_helper'

class Bank

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance.to_f
    @history = [["date || credit || debit || balance"]]
    save_to_history
  end

  def deposit(amount)
    @balance += amount
    save_to_history(credit: amount)
  end

  def withdraw(amount)
    @balance -= amount
    save_to_history(debit: amount)
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
    statement_line << credit == nil ? '' : credit.to_f
    # adding debit
    statement_line << debit == nil ? '' : debit.to_f
    # adding day's balance
    statement_line << @balance.to_s
    # adding formatted line
    @history << statement_line.join(' || ')
  end

end
