require 'statement'

RSpec.describe Statement do

  context "when initialized" do
    it 'has the header but no transactions' do
      statement = Statement.new
      expect(statement.is_a?(Statement)).to eq true
      expect(statement.print).to eq "date || credit || debit || balance\n"
    end
  end

end