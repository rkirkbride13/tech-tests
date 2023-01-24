require 'bank'
require 'transaction'

RSpec.describe Bank do
  context "when initialized" do
    it 'has an account balance of 0.00 and an empty transaction array' do
      bank = Bank.new
      expect(bank.is_a?(Bank)).to eq true
      expect(bank.check_balance).to eq 0.00
      expect(bank.print_statement).to eq 'date || credit || debit || balance'
    end
  end

  context "when adding a single deposit/withdrawal transaction" do
    it 'has a positive balance if its a deposit' do
      bank = Bank.new
      fake_date = double :date
      transaction = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction)
      expect(bank.check_balance).to eq 1.00
    end

    it 'has a balance less than the initial deposit value' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(10, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(-1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      expect(bank.check_balance).to eq 9.00
    end
  end

  context "several deposits / withdrawals can be made and the balance is checked" do
    it 'can calculate the balance after several deposits' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(2, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction3 = Transaction.new(9, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      bank.add_transaction(transaction3)
      expect(bank.check_balance).to eq 12.00
    end

    it 'can calculate the balance after several withdrawals' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(2, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction3 = Transaction.new(9, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction4 = Transaction.new(-1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction5 = Transaction.new(-2, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction6 = Transaction.new(-5, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      bank.add_transaction(transaction3)
      bank.add_transaction(transaction4)
      bank.add_transaction(transaction5)
      bank.add_transaction(transaction6)
      expect(bank.check_balance).to eq 4.00
    end

    it 'can calculate the balance after the example transaction sequence' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(1000, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(2000, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction3 = Transaction.new(-500, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      bank.add_transaction(transaction3)
      expect(bank.check_balance).to eq 2500.00
    end
  end

  context "printing a statement after a single deposit / withdrawal" do
    it 'prints after a single deposit' do
      bank = Bank.new
      fake_date = double :date
      transaction = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction)
      expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a single withdrawal' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(10, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(-1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || || 1.00 || 9.00\n23/01/2023 || 10.00 || || 10.00"
    end
  end

  context "several deposits / withdrawals can be made and the statement printed" do
    it 'prints after a multiple deposits' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(2, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || 2.00 || || 3.00\n23/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a multiple withdrawals' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(45, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction2 = Transaction.new(-10, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      transaction3 = Transaction.new(-25, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      bank.add_transaction(transaction3)
      expect(bank.print_statement).to eq "date || credit || debit || balance\n23/01/2023 || || 25.00 || 10.00\n23/01/2023 || || 10.00 || 35.00\n23/01/2023 || 45.00 || || 45.00"
    end

    it 'prints the example transaction sequence' do
      bank = Bank.new
      fake_date = double :date
      transaction1 = Transaction.new(1000, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("10/01/2023")
      transaction2 = Transaction.new(2000, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("13/01/2023")
      transaction3 = Transaction.new(-500, fake_date)
      expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("14/01/2023")
      bank.add_transaction(transaction1)
      bank.add_transaction(transaction2)
      bank.add_transaction(transaction3)
      expect(bank.print_statement).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    end
  end

  it 'raises error if there are insufficient funds' do
    bank = Bank.new
    fake_date = double :date
    transaction1 = Transaction.new(10, fake_date)
    expect(fake_date).to receive(:strftime).with("%d/%m/%Y").and_return("23/01/2023")
    bank.add_transaction(transaction1)
    transaction2 = Transaction.new(-100, fake_date)
    expect { bank.add_transaction(transaction2) }.to raise_error 'Insufficienet funds'
  end

end
