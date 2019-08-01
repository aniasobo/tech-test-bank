require_relative 'date_helper.rb'

class Statement

  def self.begin_history(balance, current_date = Today)
    @history = ["date || credit || debit || balance"]
    @current_date = current_date
    save_credit(balance, balance)
  end

  def self.print_statement
    @history.join("\n")
  end

  def self.save_credit(deposit, balance)
    @history << "#{@current_date.print_formatted} || #{deposit}.00 || || #{balance}.00"
  end

  def self.save_debit(withdrawal, balance)
    @history << "#{@current_date.print_formatted} || || #{withdrawal}.00 || #{balance}.00"
  end
end
