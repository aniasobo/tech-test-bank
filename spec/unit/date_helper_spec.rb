require 'date_helper'

RSpec.describe Today do
  it 'prints the date in the correct format' do
    date = Today.print_formatted
    expect(date).to match(/\d{2}\/\d{2}\/\d{4}/)
  end
end
