class Vehicle
  attr_reader :license_plate_number
  def initialize(license_plate_number)
    @license_plate_number = license_plate_number
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

