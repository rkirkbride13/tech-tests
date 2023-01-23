class Transaction
  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def amount
    return @amount
  end

  def date
    formatted_date = @date.today.to_s
    return "#{formatted_date[8..9]}/#{formatted_date[5..6]}/#{formatted_date[0..3]}"
  end
end