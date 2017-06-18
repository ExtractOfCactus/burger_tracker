require('minitest/autorun')
require('minitest/rg')
require_relative('../models/deal')
require_relative('../models/day')

class TestDeal < MiniTest::Test

  def setup

    @wednesday = Day.new({ "day" => "Wednesday"})
    @thursday = Day.new({ "day" => "Thursday"})
    
    @deal_1 = Deal.new({
      "title" => "Half price bunglers",
      "price_mod" => 0.5,
      "day_id" => @wednesday.id
    })

    @deal_2 = Deal.new({
      "title" => "Royal Thursdays",
      "price_mod" => 0.75,
      "day_id" => @thursday.id
    })

  end

  def test_deal_has_title
    assert_equal("Royal Thursdays", @deal_2.title())
  end

end