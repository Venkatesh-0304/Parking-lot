require "time"
module CalculateTime
  def calculate_time(entry_time, exit_time)
    duration_seconds = exit_time - entry_time
    hours = (duration_seconds / 3600).to_i
    minutes = (((duration_seconds / 3600) * 60)% 60).to_i
    return "#{hours}.#{minutes}"
  end
end