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


  def Day.delete_all()
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

end
