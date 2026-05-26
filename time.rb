require "time"
module CalculateTime
  def calculate_time(entry_time, exit_time)
    entry = entry_time
    exit = exit_time

    duration_seconds = exit - entry
    hours = (duration_seconds / 3600).to_i
    minutes = (((duration_seconds / 3600) * 60)% 60).to_i
    return hours,minutes
  end
end