require_relative "vehicle"
require_relative "parking-spot"
class ParkingLot
  attr_accessor :name, :spots, :vehichles, :tickets
  def initialize(name)
    @name = name
    @spots = []
    @vehicles = []
    @tickets = []
  end
  
  def add_spot(spot_no)
    spot = ParkingSpot.new(spot_no)
    @spots << spot
  end

  def show_spots
    @spots.each do |s|
      puts "#{s.spot_no} "
    end
  end

end

pl1 = ParkingLot.new("Garuda")

puts pl1.name
pl1.add_spot(2)
pl1.add_spot(3)
pl1.show_spots
