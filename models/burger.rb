require_relative('../db/sql_runner')

class Burger
  attr_reader :id, :name, :price, :restaurant_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["id"]
    @price = options["price"].to_f
    @restaurant_id = options["restaurant_id"]
  end


end