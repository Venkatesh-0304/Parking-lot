# require_relative "vehicle"
# require_relative "parking-spot"
class Ticket
  attr_accessor :license_plate_number, :spot_no, :entry_time, :status
  def initialize(vehicle, spot)
    time = Time.now
    @license_plate_number = vehicle.license_plate_number
    @spot_no = spot.spot_no
    @status = true
    @entry_time = time.strftime("%d-%m-%y %H:%M")
  end

  def status?
    @status
  end
  
end
# s1 = ParkingSpot.new(1)
# v1 = Vehicle.new("ka-05-ju-0376")
# t1 = Ticket.new(v1, s1)
# puts t1.license_plate_number
# puts t1.spot_no
# puts t1.entry_time
# puts t1.status