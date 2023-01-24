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

  # def format_transaction(transaction)
  #   amount = transaction.amount
  #   date = transaction.date
  #   format_toggle = amount > 0 ? "#{amount}.00 ||" : "|| #{-amount}.00"
  #   @transactions << "#{date} || #{format_toggle} || #{@balance}0\n"
  # end

  # def print_statement
  #   @transactions << "date || credit || debit || balance\n"
  #   return @transactions.reverse.join()[0..-2]
  # end
end

puts DateTime.now