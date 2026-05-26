module CalculateAmount
  PRICE_PER_HOUR = 20
  def calculate_amount(duration)
    puts "Total amount is #{duration * PRICE_PER_HOUR}"
  end
end