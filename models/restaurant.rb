require_relative('../db/sql_runner')

class Restaurant
  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO restaurants (name) VALUES ('#{@name}' RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end


  def Restaurant.delete_all()
    sql = "DELETE FROM restaurants"
    SqlRunner.run(sql)
  end

end