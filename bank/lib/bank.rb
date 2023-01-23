class Bank

  def initialize
    @balance = 0.00
    @transactions = []
    @statement = ""
  end

  def check_balance
    return @balance
  end

  def add_transaction(transaction)
    @balance += transaction.amount
    if @balance < 0 then fail "Insufficienet funds" end
    format_transaction(transaction)
  end

  def format_transaction(transaction)
    if transaction.amount > 0
      @transactions << "#{transaction.date} || #{transaction.amount}.00 || || #{@balance}0"
    else
      @transactions << "#{transaction.date} || || #{-transaction.amount}.00 || #{@balance}0"
    end
  end

  def print_statement
    format_statement
    return @statement[0..-2]
  end

  private

  def format_statement
    @transactions << "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      @statement += transaction + "\n"
    end
  end

end
