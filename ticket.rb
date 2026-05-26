class Ticket
  attr_accessor :license_plate_number, :spot_no, :entry_time, :status
  def initialize(license_plate_number, spot_no)
    time = Time.now
    @license_plate_number = license_plate_number
    @spot_no = spot_no
    @status = true
    @entry_time = time.strftime("%d-%m-%y %H:%M")
  end

  def status?
    @status
  end
end

t1 = Ticket.new("ka-05-ju-0376", 1)
puts t1.license_plate_number
puts t1.spot_no
puts t1.entry_time
puts t1.status