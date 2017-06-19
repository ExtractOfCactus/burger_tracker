require_relative('../db/sql_runner')
require_relative('burger')

class Restaurant
  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO restaurants (name) VALUES ('#{@name}') RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def burgers()
    sql = "SELECT burgers.* FROM burgers WHERE restaurant_id = #{@id}"
    burger_hashes = SqlRunner.run(sql)
    result = burger_hashes.map {|burger_hash| Burger.new(burger_hash)}
    return result
  end


  def Restaurant.all()
    sql = "SELECT * FROM restaurants"
    restaurants_data = SqlRunner.run(sql)
    result = restaurants_data.map { |restaurant| Restaurant.new(restaurant) }
    return result
  end

  def Restaurant.find(id)
    sql = "SELECT * FROM restaurants WHERE id = #{id}"
    restaurant_hash = SqlRunner.run(sql).first()
    return Restaurant.new(restaurant_hash)
  end

  def Restaurant.delete_all()
    sql = "DELETE FROM restaurants"
    SqlRunner.run(sql)
  end

end