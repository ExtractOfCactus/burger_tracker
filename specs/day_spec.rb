require('minitest/autorun')
require('minitest/rg')
require_relative('../models/day')

class TestDay < MiniTest::Test

  def setup
    @saturday = Day.new({ "day" => "Saturday"})
    @sunday = Day.new({ "day" => "Sunday"})
  end

    def test_day_has_name
      assert_equal("Sunday", @sunday.day())
    end

end