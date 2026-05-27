class ParkingSpot
  attr_accessor :spot_no, :spot_type
  def initialize(spot_no, spot_type)
    @spot_no = spot_no
    @spot_type = spot_type
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

  def can_fit?(vehicle_type)
    if vehicle_type == "motorcycle"
      true
    elsif vehicle_type == "car"
      @spot_type == "regular" || @spot_type == "oversized"
    elsif vehicle_type == "truck"
      @spot_type == "oversized"
    else
      puts "No spot is available for this vehicle"
    end
  end
end


