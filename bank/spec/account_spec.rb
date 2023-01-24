require 'account'

RSpec.describe Account do
  context "when initialized" do
    it 'has an account balance of 0.00 and an empty transaction array' do
      account = Account.new
      expect(account.is_a?(Account)).to eq true
      expect(account.check_balance).to eq 0.00
    end
  end

  context "when adding a single deposit/withdrawal transaction" do
    it 'has a positive balance if its a deposit' do
      account = Account.new
      transaction = double :transaction, amount: 1, date: '01/01/2023'
      account.add_transaction(transaction)
      expect(account.check_balance).to eq 1.00
    end

    it 'has a balance less than the initial deposit value' do
      account = Account.new
      transaction1 = double :transaction, amount: 10, date: '01/01/2023'
      transaction2 = double :transaction, amount: -1, date: '01/01/2023'
      account.add_transaction(transaction1)
      account.add_transaction(transaction2)
      expect(account.check_balance).to eq 9.00
    end
  end

  context "several deposits / withdrawals can be made and the balance is checked" do 
    it 'can calculate the balance after several deposits' do
      account = Account.new
      transaction1 = double :transaction, amount: 1, date: '01/01/2023'
      transaction2 = double :transaction, amount: 2, date: '01/01/2023'
      transaction3 = double :transaction, amount: 9, date: '01/01/2023'
      account.add_transaction(transaction1)
      account.add_transaction(transaction2)
      account.add_transaction(transaction3)
      expect(account.check_balance).to eq 12.00
    end

    it 'can calculate the balance after several withdrawals' do
      account = Account.new
      transaction1 = double :transaction, amount: 20, date: '01/01/2023'
      transaction2 = double :transaction, amount: -2, date: '01/01/2023'
      transaction3 = double :transaction, amount: -5, date: '01/01/2023'
      transaction4 = double :transaction, amount: -11, date: '01/01/2023'
      account.add_transaction(transaction1)
      account.add_transaction(transaction2)
      account.add_transaction(transaction3)
      account.add_transaction(transaction4)
      expect(account.check_balance).to eq 2.00
    end

    it 'can calculate the balance after the example transaction sequence' do
      account = Account.new
      transaction1 = double :transaction, amount: 1000, date: '01/01/2023'
      transaction2 = double :transaction, amount: 2000, date: '01/01/2023'
      transaction3 = double :transaction, amount: -500, date: '01/01/2023'
      account.add_transaction(transaction1)
      account.add_transaction(transaction2)
      account.add_transaction(transaction3)
      expect(account.check_balance).to eq 2500.00
    end
  end

  it 'raises error if there are insufficient funds' do
    account = Account.new
    fake_date = double :date
    transaction1 = double :transaction, amount: 10, date: '10/01/2023'
    account.add_transaction(transaction1)
    transaction2 = double :transaction, amount: -100, date: '13/01/2023'
    expect { account.add_transaction(transaction2) }.to raise_error 'Insufficienet funds'
  end
end

