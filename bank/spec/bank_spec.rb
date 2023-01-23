require 'bank'

RSpec.describe Bank do

  it "initializes with an account balance of 0.00 and an empty transaction array" do
    bank = Bank.new
    expect(bank.is_a?(Bank)).to eq true
    expect(bank.check_balance).to eq 0.00
    expect(bank.print_statement).to eq "date || credit || debit || balance"
  end

  it "can deposit money once and check balance for that deposit value" do
    bank = Bank.new
    transaction = double :transaction, amount: 1, date: "01/01/2023"
    bank.add_transaction(transaction)
    expect(bank.check_balance).to eq 1.00
  end

  it "can withdraw money once and check balance for that withdraw value" do
    bank = Bank.new
    transaction = double :transaction, amount: -1, date: "01/01/2023"
    bank.add_transaction(transaction)
    expect(bank.check_balance).to eq -1.00
  end

end