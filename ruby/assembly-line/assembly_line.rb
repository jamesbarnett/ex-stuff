class AssemblyLine
  BASE_PRODUCTION = 221.0
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    BASE_PRODUCTION * @speed * success_rate / 100.0
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def success_rate
    case @speed
    when 1..4
      100.0
    when 5..8
      90.0
    when 9
      80.0
    when 10
      77.0
    else
      raise Exception.new "Invalid speed!"
    end
  end
end
