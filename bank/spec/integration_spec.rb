require 'bank'
require 'transaction'

RSpec.describe Bank do
  
  it "initializes with an account balance of 0.00" do
    bank = Bank.new
    expect(bank.check_balance).to eq 0.00
  end

  it "can deposit money and check balance for that deposit value" do
    bank = Bank.new
    transaction = Transaction.new(1, "01/01/2023")
    bank.add_transaction(transaction)
    expect(bank.check_balance).to eq 1.00
  end

  it "can withdraw money and check balance for that withdrawn value" do
    bank = Bank.new
    transaction = Transaction.new(-1, "01/01/2023")
    bank.add_transaction(transaction)
    expect(bank.check_balance).to eq -1.00
  end

  it "can deposit money several times and check balance for total balance value" do
    bank = Bank.new
    transaction_1 = Transaction.new(1, "01/01/2023")
    transaction_2 = Transaction.new(2, "01/01/2023")
    transaction_3 = Transaction.new(9, "01/01/2023")
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.check_balance).to eq 12.00
  end

  it "can withdraw money several times and check balance for total balance value" do
    bank = Bank.new
    transaction_1 = Transaction.new(-1, "01/01/2023")
    transaction_2 = Transaction.new(-2, "01/01/2023")
    transaction_3 = Transaction.new(-11, "01/01/2023")
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.check_balance).to eq -14.00
  end

  it "can deposit and withdraw money and check balance for the total balance values" do
    bank = Bank.new
    transaction_1 = Transaction.new(1000, "01/01/2023")
    transaction_2 = Transaction.new(2000, "01/01/2023")
    transaction_3 = Transaction.new(-500, "01/01/2023")
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    bank.add_transaction(transaction_3)
    expect(bank.check_balance).to eq 2500.00
  end

  it "can print a statement after a single deposit" do
    bank = Bank.new
    transaction = Transaction.new(1, "01/01/2023")
    bank.add_transaction(transaction)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 1.00 || || 1.00"
  end

  it "can print a statement after a single withdrawl" do
    bank = Bank.new
    transaction = Transaction.new(-1, "01/01/2023")
    bank.add_transaction(transaction)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 1.00 || -1.00"
  end

  it "can print a statement after a multiple deposits" do
    bank = Bank.new
    transaction_1 = Transaction.new(1, "01/01/2023")
    transaction_2 = Transaction.new(2, "02/01/2023")
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n02/01/2023 || 2.00 || || 3.00\n01/01/2023 || 1.00 || || 1.00"
  end

  it "can print a statement after a multiple withdrawls" do
    bank = Bank.new
    transaction_1 = Transaction.new(-10, "01/01/2023")
    transaction_2 = Transaction.new(-25, "02/01/2023")
    bank.add_transaction(transaction_1)
    bank.add_transaction(transaction_2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n02/01/2023 || || 25.00 || -35.00\n01/01/2023 || || 10.00 || -10.00"
  end

  xit "can print a statement after deposits and withdrawls" do
    bank = Bank.new
    bank.deposit_money(1000, "10/01/2023")
    bank.deposit_money(2000, "13/01/2023")
    bank.withdraw_money(500, "14/01/2023")
    expect(bank.print_statement).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
  end

end