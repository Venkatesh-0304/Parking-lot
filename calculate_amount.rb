module CalculateAmount
  PRICE_PER_HOUR_COMPACT = 20
  PRICE_PER_HOUR_REGULAR = 30 

  def calculate_amount(duration,spot_type)
    if spot_type == "compact"
      puts "Total amount is : #{duration * PRICE_PER_HOUR_COMPACT}"
    elsif spot_type == "regular"
      puts "Total amount is : #{duration * PRICE_PER_HOUR_REGULAR}"
    end
  end
end