class Vehicle
  attr_reader :license_plate_number
  def initialize(license_plate_number, vehicle_type)
    @license_plate_number = license_plate_number
    @vehicle_type = vehicle_type
  end
end

