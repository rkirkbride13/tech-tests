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
    amount = transaction.amount
    date = transaction.date
    format_toggle = amount > 0 ? "#{amount}.00 ||" : "|| #{-amount}.00"
    @transactions << "#{date} || #{format_toggle} || #{@balance}0\n"
  end

  def print_statement
    @transactions << "date || credit || debit || balance\n"
    return @transactions.reverse.join()[0..-2]
  end
end
