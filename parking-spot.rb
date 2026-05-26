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
    else
      puts "Spot #{spot_no} is not available"
    end
  end

  def unpark!
    if !available?
      @available = true
      puts "Spot #{spot_no} released"
    else
      puts "Spot is not occupied"
    end
  end
end

s1 = ParkingSpot.new(1)

puts s1.spot_no
puts s1.available?
s1.park!
s1.unpark!
