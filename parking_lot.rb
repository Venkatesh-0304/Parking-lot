require_relative "time"
require_relative "calculate_amount"
require_relative "ticket"
require_relative "parking_spot"
require_relative "vehicle"
class ParkingLot
  include CalculateTime
  include CalculateAmount
  attr_accessor :name, :spots, :vehicles, :tickets

  
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

  def park_vehicle(license_plate_number, type)
    if find_vehicle(license_plate_number) != nil
      puts "Cannot park vehicle which is already Parked #{license_plate_number}"
    else
      spot = find_available_spot
      if spot != nil
        if type == "bike"    
          vehicle = Bike.new(license_plate_number)
          @vehicles << vehicle
        elsif type == "car"
          vehicle = Car.new(license_plate_number)
          @vehicles << vehicle
        elsif type == "truck"
          vehicle = Truck.new(license_plate_number)
          @vehicles << vehicle
        else
          puts "Invalid Vehicle type"
          return
        end
        ticket = Ticket.new(vehicle, spot)
        @tickets << ticket
        spot.park!
        puts "#{license_plate_number} parked successfully"
      else
        puts "No spot Available"
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
      entry_time = ticket.entry_time
      spot_no = ticket.spot_no
      spot = find_spot(spot_no)
      spot.unpark!
      exit_time = (Time.now + (3600 * 4) + ((3600 / 60)*30))
      duration = calculate_time(entry_time, exit_time).to_f
      @tickets.delete(ticket)
      puts "#{license_plate_number} unparked successfully"
      fee = calculate_amount(duration)
    else
      puts "Vehicle is not Parked here"
    end
  end
end


