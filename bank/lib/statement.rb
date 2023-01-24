class Statement
  def initialize(account)
    @header = "date || credit || debit || balance\n"
    @account = account
    @transaction_index = -1
  end

  def format_transactions
    @account.transactions.map do |transaction|
      @transaction_index += 1
      balance = @account.balance_at(@transaction_index)
      "#{transaction.format_date} || #{transaction.format_amount} || #{balance}.00\n"
    end
  end

  def print_statement
    formatted_statement = format_transactions << @header
    return formatted_statement.reverse.join()[0..-2]
  end
end
