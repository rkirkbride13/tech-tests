class Account
  def initialize
    @transactions = []
    @balance = 0
  end

  def add_transaction(transaction)
    @transactions << transaction
    raise 'Insufficienet funds' if latest_balance.negative?
  end

  def transactions
    @transactions
  end

  def balance_at(transaction_index)
    transactions = @transactions[0..transaction_index]
    transactions.sum {|transaction| transaction.amount}
  end

  def latest_balance
    @transactions.sum {|transaction| transaction.amount}
  end
end
