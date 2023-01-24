class Account
  def initialize
    @transactions = []
  end

  def add_transaction(transaction)
    @transactions << transaction
    raise 'Insufficienet funds' if check_balance.negative?
  end

  def transactions
    @transactions
  end

  def check_balance
    @transactions.sum {|transaction| transaction.amount}
  end
end
