require_relative "time"
require_relative "parking-spot"
require_relative "vehicle"
require_relative "parking-lot"
require_relative "ticket"


pl1 = ParkingLot.new("Garuda")

puts pl1.name
pl1.add_spot(2)
pl1.add_spot(3)

pl1.park_vehicle("ka-o5-ju-0377")
pl1.park_vehicle("ka-o5-ju-0378")


pl1.park_vehicle("ka-o5-ju-0376")

pl1.unpark_vehicle("ka-o5-ju-0376")

puts pl1.calculate_time(Time.now, Time.now + (3600 * 2) + ((3600 / 60)*25) )