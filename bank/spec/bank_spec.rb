require 'bank'

RSpec.describe Bank do

  it "initializes with an account balance of 0.00 and an empty transaction array" do
    bank = Bank.new
    expect(bank.is_a?(Bank)).to eq true
    expect(bank.check_balance).to eq 0.00
    expect(bank.print_statement).to eq "date || credit || debit || balance"
  end

end