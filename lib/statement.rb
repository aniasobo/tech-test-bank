require_relative 'date_helper.rb'

class Statement

  def self.begin_history(balance, current_date = Today)
    @history = [["date || credit || debit || balance"]]
    @current_date = current_date
    save_to_history(date: current_date, credit: balance, debit: nil, balance: balance)
  end

  def self.print_statement
    @history.join("\n")
  end

  def self.save_to_history(date: @current_date, credit: nil, debit: nil, balance: nil) 
    statement_line = []
    statement_line << @current_date.print_formatted
    statement_line << credit == nil ? '' : add_trailing_zeroes(credit)
    statement_line << debit == nil ? '' : add_trailing_zeroes(debit)
    statement_line << balance == nil ? '' : add_trailing_zeroes(balance)
    @history << statement_line.join(' || ')
  end

  private

  def self.add_trailing_zeroes(num)
    num.nil? ? num = "0.00" : '%.2f' % num 
  end

end