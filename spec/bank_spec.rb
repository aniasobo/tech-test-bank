require 'bank'

RSpec.describe Bank do
  it 'launches in an empty state' do
    bank = Bank.new
    expect(bank).to be_a(Bank)
  end
end