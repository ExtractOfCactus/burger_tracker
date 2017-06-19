require_relative('../db/sql_runner')

class Burger
  attr_reader :id, :name, :price, :restaurant_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @price = options["price"].to_f
    @restaurant_id = options["restaurant_id"]
  end

  def save()
    sql = "INSERT INTO burgers (
      name, 
      price,
      restaurant_id
      ) VALUES (
      '#{@name}',
      #{@price},
      #{@restaurant_id}
      ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end


  def Burger.all()
    sql = "SELECT * FROM burgers"
    burgers_data = SqlRunner.run(sql)
    result = burgers_data.map {|burger| Burger.new(burger)}
    return result
  end

  def Burger.delete_all()
    sql = "DELETE FROM burgers"
    SqlRunner.run(sql)
  end


end