require 'date'

class Transaction
  def initialize(amount, date=DateTime)
    @amount = amount
    @date = date
  end

  def amount
    return @amount
  end

  def date
    return @date.now
  end

  def format_amount
    @amount > 0 ? "#{@amount}.00 ||" : "|| #{-@amount}.00"
  end

  def format_date
    self.date.strftime "%d/%m/%Y"
  end
end