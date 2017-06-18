require('minitest/autorun')
require('minitest/rg')
require_relative('../models/burger')

class TestBurger < MiniTest::Test

  def setup

    @restaurant_1 = Restaurant.new({ "name" => "Odonals" })
    @restaurant_2 = Restaurant.new({ "name" => "Burger MacQueen" })

    @burger_1 = Burger.new({
      "name" => "Hambungler",
      "price" => 4.50,
      "restaurant_id" => @restaurant_1.id
    })

    @burger_2 = Burger.new({
      "name" => "Cheesibungler",
      "price" => 5,
      "restaurant_id" => @restaurant_1.id
    })

    @burger_3 = Burger.new({
      "name" => "Sir Beefy",
      "price" => 5.20,
      "restaurant_id" => @restaurant_2.id
    })

  end

  def test_burger_has_name

  end

end