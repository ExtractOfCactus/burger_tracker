require_relative('../db/sql_runner')

class BurgerDeal
  attr_reader :id, :burger_id, :deal_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @burger_id = options["burger_id"].to_i
    @deal_id = options["deal_id"].to_i
  end

end