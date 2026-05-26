class ParkingSpot
  attr_accessor :spot_no
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
    else
      puts "Spot #{spot_no} is not available"
    end
  end

  def unpark!
    if !available?
      @available = true
    else
      puts "Spot is not occupied"
    end
  end
end


