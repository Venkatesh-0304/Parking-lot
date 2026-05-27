class ParkingLot
  include CalculateTime
  include CalculateAmount
  FORMAT = "%d-%m-%y %H:%M"
  attr_accessor :name, :spots, :vehichles, :tickets
  
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

  def find_available_spot(vehicle_type)
    @spots.find do |spot|
      spot.available? && spot.can_fit?(vehicle_type)
    end
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
      spot = find_available_spot(vehicle_type)
      if spot != nil

        vehicle = Vehicle.new(license_plate_number, vehicle_type)
        @vehicles << vehicle

        ticket = Ticket.new(vehicle, spot)
        @tickets << ticket

        spot.park!
        puts "vehicle : #{vehicle_type}(#{license_plate_number})parked successfully"

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

      @vehicles.delete(vehicle)

      puts "#{license_plate_number} unparked successfully"
      calculate_amount(duration)
    else
      puts "Vehicle is not Parked here"
    end
  end
end


