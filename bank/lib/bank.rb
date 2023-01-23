class Bank
  def initialize
    @balance = 0.00
    @transactions = []
  end

  def check_balance
    @balance
  end

  def add_transaction(transaction)
    @balance += transaction.amount
    raise 'Insufficienet funds' if @balance.negative?
    format_transaction(transaction)
  end

  def format_transaction(transaction)
    @transactions << if transaction.amount.positive?
                       "#{transaction.date} || #{transaction.amount}.00 || || #{@balance}0\n"
                     else
                       "#{transaction.date} || || #{-transaction.amount}.00 || #{@balance}0\n"
                     end
  end

  def print_statement
    @transactions << "date || credit || debit || balance\n"
    return @transactions.reverse.join()[0..-2]
  end

end
