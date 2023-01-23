require 'transaction'

RSpec.describe Transaction do

  context "initializes with a transaction amount and date" do
    it "initializes as an instance of the class" do
      transaction = Transaction.new(1, "01/01/2023")
      expect(transaction.is_a?(Transaction)).to eq true
    end
    
    it "is a deposit, with positive amount" do
      transaction = Transaction.new(1, "01/01/2023")
      expect(transaction.amount).to eq 1
      expect(transaction.date).to eq "01/01/2023"
    end

    it "is a withdrawl, with negative amount" do
      transaction = Transaction.new(-1, "05/01/2023")
      expect(transaction.amount).to eq -1
      expect(transaction.date).to eq "05/01/2023"
    end
  end
end