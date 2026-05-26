class ParkingSpot
  attr_accessor :spot_no, :available
  def initialize(spot_no)
    @spot_no = spot_no
    @available = true
  end

  def available?
    @available
  end

  def park!
    if available?
      @available = false
      puts "Spot occupied"
      return @available
    else
      puts "Spot #{spot_no} is not available"
    end
  end
end

s1 = ParkingSpot.new(1)

puts s1.spot_no
puts s1.available?
puts s1.park!