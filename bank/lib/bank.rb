class Bank

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def check_balance
    return @balance
  end

  def deposit_money(funds, date)
    @balance += funds
    @transactions << "#{date} || #{funds}.00 || || #{@balance}0"
  end

  def withdraw_money(funds, date)
    @balance -= funds
    @transactions << "#{date} || || #{funds}.00 || #{@balance}0"
  end

  def print_statement
    format_statement
    return @statement[0..-2]
  end

  private

  def format_statement
    @statement = ""
    @transactions << "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      @statement += transaction + "\n"
    end
  end

end
