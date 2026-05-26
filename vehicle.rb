class Vehicle
  attr_reader :license_plate_number
  def initialize(license_plate_number)
    @license_plate_number = license_plate_number
  end
end

# v1 = Vehicle.new("ka-05-0376")

# puts v1.license_plate_number