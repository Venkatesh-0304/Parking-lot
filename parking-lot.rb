require_relative "vehicle"
require_relative "parking-spot"
require_relative "ticket"
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

  def find_available_spot
    @spots.find { |s| s.available?}
  end

  # def show_spots
  #   @spots.each do |s|
  #     puts "#{s.spot_no} #{s.available?}"
  #   end
  # end

  def find_vehicle(license_plate_number)
    @vehicles.find {|v| v.license_plate_number == license_plate_number}
  end

  def park_vehicle(license_plate_number)
    if find_vehicle(license_plate_number) != nil
      puts "Cannot park vehicle which is already Parked #{license_plate_number}"
    else
      spot = find_available_spot
      if spot != nil
        vehicle = Vehicle.new(license_plate_number)
        @vehicles << vehicle
        ticket = Ticket.new(vehicle, spot)
        @tickets << ticket
        spot.park!
        puts "#{license_plate_number} parked successfully"
      end
    end
  end
end

pl1 = ParkingLot.new("Garuda")

puts pl1.name
pl1.add_spot(2)
pl1.add_spot(3)
pl1.park_vehicle("ka-o5-ju-0376")
