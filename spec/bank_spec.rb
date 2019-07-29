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

    xit 'prints out a statement with date'
     # date = Today.print_formatted
     # expect(@bank.print_statement).to eq
  
  end
end