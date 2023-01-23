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
    transaction_1 = double :transaction, amount: 10, date: "01/01/2023"
    transaction_2 = double :transaction, amount: -1, date: "01/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    expect(bank.check_balance).to eq 9.00
  end

  it "can deposit money several times and check balance for total balance value" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 1, date: "01/01/2023"
    transaction_2 = double :transaction, amount: 2, date: "01/01/2023"
    transaction_3 = double :transaction, amount: 9, date: "01/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.check_balance).to eq 12.00
  end

  it "can withdraw money several times and check balance for total balance value" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 20, date: "01/01/2023"
    transaction_2 = double :transaction, amount: -2, date: "01/01/2023"
    transaction_3 = double :transaction, amount: -5, date: "01/01/2023"
    transaction_4 = double :transaction, amount: -11, date: "01/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    bank.add_transaction(transaction_4)
    expect(bank.check_balance).to eq 2.00
  end

  it "can deposit and withdraw money and check balance for the total balance values" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 1000, date: "01/01/2023"
    transaction_2 = double :transaction, amount: 2000, date: "01/01/2023"
    transaction_3 = double :transaction, amount: -500, date: "01/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.check_balance).to eq 2500.00
  end

  it "can print a statement after a single deposit" do
    bank = Bank.new
    transaction = double :transaction, amount: 1, date: "01/01/2023"
    bank.add_transaction(transaction)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 1.00 || || 1.00"
  end

  it "can print a statement after a single withdrawl" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 10, date: "01/01/2023"
    transaction_2 = double :transaction, amount: -1, date: "01/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 1.00 || 9.00\n01/01/2023 || 10.00 || || 10.00"
  end

  it "can print a statement after a multiple deposits" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 1, date: "01/01/2023"
    transaction_2 = double :transaction, amount: 2, date: "02/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n02/01/2023 || 2.00 || || 3.00\n01/01/2023 || 1.00 || || 1.00"
  end

  it "can print a statement after a multiple withdrawls" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 45, date: "01/01/2023"
    transaction_2 = double :transaction, amount: -10, date: "01/01/2023"
    transaction_3 = double :transaction, amount: -25, date: "02/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n02/01/2023 || || 25.00 || 10.00\n01/01/2023 || || 10.00 || 35.00\n01/01/2023 || 45.00 || || 45.00"
  end

  it "can print a statement after several deposits and withdrawls" do
    bank = Bank.new
    transaction_1 = double :transaction, amount: 1000, date: "10/01/2023"
    transaction_2 = double :transaction, amount: 2000, date: "13/01/2023"
    transaction_3 = double :transaction, amount: -500, date: "14/01/2023"
    transaction_4 = double :transaction, amount: -700, date: "15/01/2023"
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    bank.add_transaction(transaction_4)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n15/01/2023 || || 700.00 || 1800.00\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
  end

end