require 'date_helper'
require 'statement'

RSpec.describe Statement do
  subject(:statement) { described_class } 

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
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 0.00 || || 0.00")
    end
  end

  describe 'self.print_statement' do
    before(:each) do
      @today = class_double("Today")
      allow(@today).to receive(:print_formatted).and_return("dd/mm/yyyy")
    end
  
    it 'returns statement as a string' do
      subject.begin_history(10, @today)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 10.00 || || 10.00")
    end

    it 'returns multi line statement as a string' do
      subject.begin_history(10, @today)
      subject.save_credit(10, 20)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 10.00 || || 10.00\ndd/mm/yyyy || 10.00 || || 20.00")
    end
  end

  describe 'self.save_credit' do
    it 'adds a correctly formatted line of credit to history' do
      today = class_double("Today")
      allow(today).to receive(:print_formatted).and_return("dd/mm/yyyy")
      subject.begin_history(0, today)
      subject.save_credit(99, 200)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 0.00 || || 0.00\ndd/mm/yyyy || 99.00 || || 200.00")
    end
  end

  describe 'self.save_debit' do
    it 'adds a correctly formatted line of debit to history' do
      today = class_double("Today")
      allow(today).to receive(:print_formatted).and_return("dd/mm/yyyy")
      subject.begin_history(100, today)
      subject.save_debit(3, 18)
      expect(subject.print_statement).to eq("date || credit || debit || balance\ndd/mm/yyyy || 100.00 || || 100.00\ndd/mm/yyyy || || 3.00 || 18.00")
    end
  end
end
