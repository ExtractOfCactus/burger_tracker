require_relative('../db/sql_runner')
require('pry-byebug')

class Deal
  attr_reader :id, :title, :price_mod, :day_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price_mod = options["price_mod"].to_f
    @day_id = options["day_id"].to_i
  end

  def save()
    sql = "INSERT INTO deals (
      title,
      price_mod,
      day_id
      ) VALUES (
      '#{@title}',
      #{@price_mod},
      #{@day_id}
      ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end

  def days()
    sql = "SELECT * FROM days WHERE id = #{@day_id}"
    day_hashes = SqlRunner.run(sql)
    result = day_hashes.map {|day_hash| Day.new(day_hash)}
    return result
  end

  def burgers()
    sql = "SELECT burgers.* FROM burgers
      INNER JOIN burger_deals
      ON burgers.id = burger_deals.burger_id
      WHERE burger_deals.deal_id = #{@id}"
     burger_hashes = SqlRunner.run(sql) 
     result = burger_hashes.map {|burger_hash| Burger.new(burger_hash)}
     return result
  end

  def restaurant()
    sql = "SELECT restaurants.* FROM restaurants
      INNER JOIN burgers
      ON restaurants.id = burgers.restaurant_id
      INNER JOIN burger_deals
      ON burgers.id = burger_deals.burger_id
      WHERE burger_deals.deal_id = #{@id}"
    restaurant_hash = SqlRunner.run(sql).first()
    result = Restaurant.new(restaurant_hash)
    return result
  end


  def Deal.all()
    sql = "SELECT * FROM deals"
    deal_hashes = SqlRunner.run(sql)
    result = deal_hashes.map {|deal_hash| Deal.new(deal_hash)}
    return result
  end

  def Deal.delete_all()
    sql = 'DELETE FROM deals'
    deal_hashes = SqlRunner.run(sql)
    result = deal_hashes.map {|deal_hash| Deal.new(deal_hash)}
    return result
  end


  def sql_runner(sql)
    deal_hashes = SqlRunner.run(sql)
    result = deal_hashes.map {|deal_hash| Deal.new(deal_hash)}
    return result
  end


end

