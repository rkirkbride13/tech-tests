class Transaction
  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def amount
    return @amount
  end

  def date
    return @date.now
  end

  def format_date
    return self.date.strftime "%d/%m/%Y"
  end
end