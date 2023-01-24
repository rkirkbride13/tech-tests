class Statement
  def initialize(account)
    @header = "date || credit || debit || balance\n"
    @account = account
  end

  def format_statement
    balance = 0
    @account.transactions.map do |transaction|
      amount = transaction.amount
      date = transaction.format_date
      format_toggle = amount > 0 ? "#{amount}.00 ||" : "|| #{-amount}.00"
      "#{date} || #{format_toggle} || #{balance += amount}.00\n"
    end
  end

  def print_statement
    formatted_statement = format_statement << @header
    return formatted_statement.reverse.join()[0..-2]
  end

end