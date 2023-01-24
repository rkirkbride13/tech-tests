class Statement
  def initialize
    @header = "date || credit || debit || balance\n"
  end

  # def format_transaction(transaction)
  #   amount = transaction.amount
  #   date = transaction.date
  #   format_toggle = amount > 0 ? "#{amount}.00 ||" : "|| #{-amount}.00"
  #   @transactions << "#{date} || #{format_toggle} || #{@balance}0\n"
  # end

  def print
    @header
    # return @transactions.reverse.join()[0..-2]
  end

end