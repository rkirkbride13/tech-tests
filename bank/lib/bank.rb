class Bank
  def initialize
    @balance = 0.00
    @transactions = []
    @statement = ''
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
                       "#{transaction.date} || #{transaction.amount}.00 || || #{@balance}0"
                     else
                       "#{transaction.date} || || #{-transaction.amount}.00 || #{@balance}0"
                     end
  end

  def print_statement
    format_statement
    @statement[0..-2]
  end

  private

  def format_statement
    @transactions << 'date || credit || debit || balance'
    @transactions.reverse.each do |transaction|
      @statement += "#{transaction}\n"
    end
  end
end
