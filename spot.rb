class ParkingSpot
  attr_accessor :spot_no, :available
  def initialize(spot_no)
    @spot_no = spot_no
    @available = true
  end
end

s1 = ParkingSpot.new(1)

puts s1.spot_no
puts s1.available