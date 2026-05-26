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
