require "time"
module CalculateTime
  def calculate_time(entry_time, exit_time)
    entry = entry_time
    exit = exit_time

    duration_seconds = exit - entry
    hours = (duration_seconds / 3600).to_i
    minutes = (((duration_seconds / 3600) * 60)% 60).to_i
<<<<<<< HEAD
    return "#{hours}.#{minutes}"
=======
    return hours,minutes
>>>>>>> 7bfc6dbc4476bf7134f26753efa6511af462543a
  end
end