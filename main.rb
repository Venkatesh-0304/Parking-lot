require_relative "time"
require_relative "calculate_amount"
require_relative "parking_spot"
require_relative "vehicle"
require_relative "parking_lot"
require_relative "ticket"


pl1 = ParkingLot.new("Garuda")

puts pl1.name
pl1.add_spot(2)
pl1.add_spot(3)

pl1.park_vehicle("ka-05-ju-0377")
pl1.park_vehicle("ka-05-ju-0378")

pl1.unpark_vehicle("ka-05-ju-0377")
pl1.unpark_vehicle("ka-05-ju-0378")
