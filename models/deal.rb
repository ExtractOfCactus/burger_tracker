require_relative('../db/sql_runner')

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

end