require 'bank'
require 'transaction'

RSpec.describe Bank do
  it 'initializes with an account balance of 0.00' do
    bank = Bank.new
    expect(bank.check_balance).to eq 0.00
  end

  it 'can deposit money and check balance for that deposit value' do
    bank = Bank.new
    fake_date = double :date
    transaction = Transaction.new(1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction)
    expect(bank.check_balance).to eq 1.00
  end

  it 'can withdraw money and check balance for that withdrawn value' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(10, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(-1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    expect(bank.check_balance).to eq 9.00
  end

  it 'can deposit money several times and check balance for total balance value' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(2, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction3 = Transaction.new(9, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    bank.add_transaction(transaction3)
    expect(bank.check_balance).to eq 12.00
  end

  it 'can withdraw money several times and check balance for total balance value' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(2, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction3 = Transaction.new(9, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction4 = Transaction.new(-1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction5 = Transaction.new(-2, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction6 = Transaction.new(-5, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    bank.add_transaction(transaction3)
    bank.add_transaction(transaction4)
    bank.add_transaction(transaction5)
    bank.add_transaction(transaction6)
    expect(bank.check_balance).to eq 4.00
  end

  it 'can deposit and withdraw money and check balance for the total balance values' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(1000, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(2000, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction3 = Transaction.new(-500, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    bank.add_transaction(transaction3)
    expect(bank.check_balance).to eq 2500.00
  end

  it 'can print a statement after a single deposit' do
    bank = Bank.new
    fake_date = double :date
    transaction = Transaction.new(1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || 1.00 || || 1.00"
  end

  it 'can print a statement after a single withdrawl' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(10, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(-1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || || 1.00 || 9.00\n23/01/2023 || 10.00 || || 10.00"
  end

  it 'can print a statement after a multiple deposits' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(1, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(2, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || 2.00 || || 3.00\n23/01/2023 || 1.00 || || 1.00"
  end

  it 'can print a statement after a multiple withdrawls' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(45, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction2 = Transaction.new(-10, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    transaction3 = Transaction.new(-25, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    bank.add_transaction(transaction3)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || || 25.00 || 10.00\n23/01/2023 || || 10.00 || 35.00\n23/01/2023 || 45.00 || || 45.00"
  end

  it 'can print a statement after deposits and withdrawls' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(1000, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-10")
    transaction2 = Transaction.new(2000, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-13")
    transaction3 = Transaction.new(-500, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-14")
    bank.add_transaction(transaction1)
    bank.add_transaction(transaction2)
    bank.add_transaction(transaction3)
    expect(bank.print_statement).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
  end

  it 'raises error if there are insufficient funds' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(10, fake_date)
    expect(fake_date).to receive(:today).and_return("2023-01-23")
    bank.add_transaction(transaction1)
    transaction2 = Transaction.new(-100, fake_date)
    expect { bank.add_transaction(transaction2) }.to raise_error 'Insufficienet funds'
  end
end
