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
    # formatted_date = @date.strftime "%d/%m/%Y"
  end
end