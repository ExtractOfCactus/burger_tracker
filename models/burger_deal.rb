require_relative('../db/sql_runner')

class BurgerDeal
  attr_reader :id, :burger_id, :deal_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @burger_id = options["burger_id"].to_i
    @deal_id = options["deal_id"].to_i
  end

  def save()
    sql = "INSERT INTO burger_deals (
      burger_id,
      deal_id
      ) VALUES (
      #{@burger_id},
      #{@deal_id}
      ) RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()["id"].to_i
  end
  

  def BurgerDeal.delete_all()
    sql = "DELETE FROM burger_deals"
    SqlRunner.run(sql)
  end

  def BurgerDeal.delete(id)
    sql = "DELETE FROM burger_deals WHERE deal_id = #{id}"
    SqlRunner.run(sql)
  end

end