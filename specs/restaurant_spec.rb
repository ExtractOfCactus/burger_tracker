require('minitest/autorun')
require('minitest/rg')
require_relative('../models/restaurant.rb')

class TestRestaurant < MiniTest::Test

  def setup
    @restaurant_1 = Restaurant.new({ "name" => "Odonals"})
    @restaurant_2 = Restaurant.new({ "name" => "Burger MacQueen"})
  end

  def test_restaurant_has_name
    assert_equal("Odonals", @restaurant_1.name())
  end

end