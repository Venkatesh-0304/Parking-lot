class Ticket
  attr_accessor :license_plate_number, :spot_no, :entry_time, :status
  
  def initialize(vehicle, spot)
    @license_plate_number = vehicle.license_plate_number
    @spot_no = spot.spot_no
    @status = true
    @entry_time = Time.now
  end
end
