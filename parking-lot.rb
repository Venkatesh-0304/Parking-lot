require_relative "vehicle"
require_relative "parking-spot"
require_relative "ticket"

class ParkingLot
  include CalculateTime
  FORMAT = "%d-%m-%y %H:%M"
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

  def find_spot(spot_no)
    @spots.find {|s| s.spot_no == spot_no}
  end

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
      else
        puts "No spot available at the movement"
      end
    end
  end

  def find_ticket(license_plate_number)
    @tickets.find {|t| t.license_plate_number == license_plate_number}
  end

  def unpark_vehicle(license_plate_number)
    vehicle = find_vehicle(license_plate_number)
    if vehicle != nil
      ticket = find_ticket(license_plate_number)
      spot_no = ticket.spot_no
      spot = find_spot(spot_no)
      spot.unpark!
      @tickets.delete(ticket)
      puts "#{license_plate_number} unparked successfully"
    end
  end
end
