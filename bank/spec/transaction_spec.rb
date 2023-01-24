require 'transaction'

RSpec.describe Transaction do
  context 'initializes with a transaction amount and date' do
    it 'initializes as an instance of the class' do
      fake_date = double :date
      transaction = Transaction.new(1, fake_date)
      expect(transaction.is_a?(Transaction)).to eq true
    end

    it 'is a deposit, with positive amount' do
      fake_date = double :date
      transaction = Transaction.new(1, fake_date)
      expect(fake_date).to receive(:now).and_return("23/01/2023")
      expect(transaction.amount).to eq 1
      expect(transaction.date).to eq '23/01/2023'
    end

    it 'is a withdrawl, with negative amount' do
      fake_date = double :date
      transaction = Transaction.new(-1, fake_date)
      expect(fake_date).to receive(:now).and_return("23/01/2023")
      expect(transaction.amount).to eq(-1)
      expect(transaction.date).to eq '23/01/2023'
    end
  end
end
