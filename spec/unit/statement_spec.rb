require 'date_helper'
require 'statement'

RSpec.describe Statement do
  subject(:statement) { described_class } 

  describe 'self.save_to_history' do
    it 'returns correct history with all args given' do
      today = class_double("Today")
      allow(today).to receive(:print_formatted).and_return("dd/mm/yyyy")
      subject.begin_history(0, today)
      expect(subject.save_to_history(date: today, credit: 10, debit: 5, balance: 55)).to eq([["date || credit || debit || balance"], 'dd/mm/yyyy || 0.00 ||  || 0.00', 'dd/mm/yyyy || 10.00 || 5.00 || 55.00'])
    end
  end

  describe 'self.begin_history' do
    before(:each) do
      @today = class_double("Today")
      allow(@today).to receive(:print_formatted).and_return("dd/mm/yyyy")
    end
  
    it 'launches succesfully' do
      expect(subject.begin_history(0, @today)).to be_truthy
    end

    it 'has dated history at launch' do
      subject.begin_history(0, @today)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 0.00 ||  || 0.00")
    end
  end

  describe 'self.print_statement' do
    before(:each) do
      @today = class_double("Today")
      allow(@today).to receive(:print_formatted).and_return("dd/mm/yyyy")
    end
  
    it 'returns statement as a string' do
      subject.begin_history(10, @today)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 10.00 ||  || 10.00")
    end

    it 'returns multi line statement as a string' do
      subject.begin_history(10, @today)
      subject.save_to_history(credit: 10, balance: 20)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 10.00 ||  || 10.00\ndd/mm/yyyy || 10.00 ||  || 20.00")
    end
  end

end
