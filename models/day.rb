class Day
  attr_reader :id, :day

  def initialize(options)
    @id = options["id"].to_i
    @day = options["day"]
  end

  def save()
    sql = "INSERT INTO days (day) VALUES ('#{@day}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end


  def Day.all()
    sql = "SELECT * FROM days"
    days_hashes = SqlRunner.run(sql)
    result = days_hashes.map {|day_hash| Day.new(day_hash)}
    return result
  end

  def Day.delete_all()
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

  def Day.which_day?()
    time = Time.new()
    weekday_num = time.wday()
    if weekday_num != 0
      sql = "SELECT * FROM days WHERE id = #{weekday_num}"
      day_hashes = SqlRunner.run(sql)
      day = (day_hashes.map{|day_hash| Day.new(day_hash)}).first()
      return day.day()
    else
      return "Sunday"
    end
  end

end
