require_relative('../db/sql_runner')
require_relative('restaurant')
require_relative('deal')

class Burger
  attr_reader :id, :name, :restaurant_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @restaurant_id = options["restaurant_id"]
  end

  def save()
    sql = "INSERT INTO burgers (
      name, 
      restaurant_id
      ) VALUES (
      '#{@name}',
      #{@restaurant_id}
      ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def restaurant()
    sql = "SELECT * FROM restaurants WHERE id = #{@restaurant_id}"
    rest_hashes = SqlRunner.run(sql)
    result = rest_hashes.map {|rest_hash| Restaurant.new(rest_hash)}
    return result.first()
  end 

  def deals()
    sql = "SELECT deals.* FROM deals
    INNER JOIN burger_deals
    ON deals.id = burger_deals.deal_id
    WHERE burger_deals.burger_id = #{@id}"
    deals_hashes = SqlRunner.run(sql)
    result = deals_hashes.map {|deal_hash| Deal.new(deal_hash)}
    return result
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