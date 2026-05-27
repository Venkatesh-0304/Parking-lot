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
  
  def add_spot(spot_no, spot_type)
    spot = ParkingSpot.new(spot_no, spot_type)
    @spots << spot
    puts "Spot no : #{spot_no} and Spot type: #{spot_type} added"
  end

  def find_available_spot(spot_type)
    @spots.find { |s| s.spot_type == spot_type && s.available?}
  end

  def find_spot(spot_no)
    @spots.find {|s| s.spot_no == spot_no}
  end

  def find_vehicle(license_plate_number)
    @vehicles.find {|v| v.license_plate_number == license_plate_number}
  end

  def park_vehicle(license_plate_number, vehicle_type)
    if find_vehicle(license_plate_number) != nil
      puts "Cannot park vehicle which is already Parked #{license_plate_number}"
    else 
      required_spot_type = nil
      if vehicle_type == "Bike" 
        required_spot_type = "compact"
      elsif vehicle_type == "Car"
        required_spot_type = "regular"
      else
        puts "Invalid Vehicle type"
        return
      end
      spot = find_available_spot(required_spot_type)
      if spot != nil
        if vehicle_type == "Bike"
          vehicle = Bike.new(license_plate_number, vehicle_type)
        elsif vehicle_type == "Car"
          vehicle = Car.new(license_plate_number, vehicle_type)
        else
          puts "Invalid vehicle type"
          return
        end
        @vehicles << vehicle
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
      spot_type = spot.spot_type
      spot.unpark!
      exit_time = (Time.now + (3600 * 4) + ((3600 / 60)*30))
      duration = calculate_time(entry_time, exit_time).to_f
      @tickets.delete(ticket)
      puts "#{license_plate_number} unparked successfully"
      calculate_amount(duration, spot_type)
    else
      puts "Vehicle is not Parked here"
    end
  end
end