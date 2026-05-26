class ParkingLot
  attr_accessor :name, :spots, :vehichles, :tickets
  def initialize(name)
    @name = name
    @spots = []
    @vehichles = []
    @tickets = []
  end
end

pl1 = ParkingLot.new("Garuda")

puts pl1.name
puts pl1.spots
puts pl1.vehichles
puts pl1.tickets
