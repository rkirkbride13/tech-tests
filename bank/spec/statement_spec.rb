require 'statement'

RSpec.describe Statement do

  context "printing a statement after a single deposit / withdrawal" do
    it 'prints after a single deposit' do
      transaction = double :transaction, amount: 1, format_date: '01/01/2023'
      account = double :account, transactions: [transaction]
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a single withdrawal' do
      transaction1 = double :transaction, amount: 10, format_date: '01/01/2023'
      transaction2 = double :transaction, amount: -1, format_date: '01/01/2023'
      account = double :account, transactions: [transaction1, transaction2]
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 1.00 || 9.00\n01/01/2023 || 10.00 || || 10.00"
    end
  end

  context "several deposits / withdrawals can be made and the statement printed" do
    it 'prints after a multiple deposits' do
      transaction1 = double :transaction, amount: 1, format_date: '01/01/2023'
      transaction2 = double :transaction, amount: 2, format_date: '01/01/2023'
      account = double :account, transactions: [transaction1, transaction2]
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || 2.00 || || 3.00\n01/01/2023 || 1.00 || || 1.00"
    end

    it 'prints after a multiple withdrawls' do
      transaction1 = double :transaction, amount: 45, format_date: '01/01/2023'
      transaction2 = double :transaction, amount: -10, format_date: '01/01/2023'
      transaction3 = double :transaction, amount: -25, format_date: '01/01/2023'
      account = double :account, transactions: [transaction1, transaction2, transaction3]
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n01/01/2023 || || 25.00 || 10.00\n01/01/2023 || || 10.00 || 35.00\n01/01/2023 || 45.00 || || 45.00"
    end

    it 'prints the example transaction sequence' do
      transaction1 = double :transaction, amount: 1000, format_date: '10/01/2023'
      transaction2 = double :transaction, amount: 2000, format_date: '13/01/2023'
      transaction3 = double :transaction, amount: -500, format_date: '14/01/2023'
      account = double :account, transactions: [transaction1, transaction2, transaction3]
      statement = Statement.new(account)
      expect(statement.print_statement).to eq "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    end
  end
end