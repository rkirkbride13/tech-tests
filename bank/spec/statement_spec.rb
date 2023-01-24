require 'statement'

RSpec.describe Statement do

  context "printing a statement after a single deposit / withdrawal" do
    it 'prints after a single deposit' do
      transaction = double :transaction, format_amount: "1.00 ||", format_date: "01/01/2023"
      account = double :account, transactions: [transaction]
      expect(account).to receive(:balance_at).with(0).and_return(1)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a single withdrawal' do
      transaction1 = double :transaction, format_amount: "10.00 ||", format_date: "01/01/2023"
      transaction2 = double :transaction, format_amount: "|| 1.00", format_date: "01/01/2023"
      account = double :account, transactions: [transaction1, transaction2]
      expect(account).to receive(:balance_at).with(0).and_return(10)
      expect(account).to receive(:balance_at).with(1).and_return(9)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 1.00 || 9.00\n01/01/2023 || 10.00 || || 10.00"
    end
  end

  context "several deposits / withdrawals can be made and the statement printed" do
    it 'prints after a multiple deposits' do
      transaction1 = double :transaction, format_amount: "1.00 ||", format_date: "01/01/2023"
      transaction2 = double :transaction, format_amount: "2.00 ||", format_date: "01/01/2023"
      account = double :account, transactions: [transaction1, transaction2]
      expect(account).to receive(:balance_at).with(0).and_return(1)
      expect(account).to receive(:balance_at).with(1).and_return(3)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 2.00 || || 3.00\n01/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a multiple withdrawls' do
      transaction1 = double :transaction, format_amount: "45.00 ||", format_date: "01/01/2023"
      transaction2 = double :transaction, format_amount: "|| 10.00", format_date: "01/01/2023"
      transaction3 = double :transaction, format_amount: "|| 25.00", format_date: "01/01/2023"
      account = double :account, transactions: [transaction1, transaction2, transaction3]
      expect(account).to receive(:balance_at).with(0).and_return(45)
      expect(account).to receive(:balance_at).with(1).and_return(35)
      expect(account).to receive(:balance_at).with(2).and_return(10)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 25.00 || 10.00\n01/01/2023 || || 10.00 || 35.00\n01/01/2023 || 45.00 || || 45.00"
    end

    it 'prints the example transaction sequence' do
      transaction1 = double :transaction, format_amount: "1000.00 ||", format_date: "10/01/2023"
      transaction2 = double :transaction, format_amount: "2000.00 ||", format_date: "13/01/2023"
      transaction3 = double :transaction, format_amount: "|| 500.00", format_date: "14/01/2023"
      account = double :account, transactions: [transaction1, transaction2, transaction3]
      expect(account).to receive(:balance_at).with(0).and_return(1000)
      expect(account).to receive(:balance_at).with(1).and_return(3000)
      expect(account).to receive(:balance_at).with(2).and_return(2500)
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    end
  end
end