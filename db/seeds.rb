require_relative('../models/day')
require_relative('../models/restaurant')
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/burger_deal')

BurgerDeal.delete_all()
Deal.delete_all()
Burger.delete_all()
Restaurant.delete_all()
Day.delete_all()

monday = Day.new({ "name" => "Monday"})
tuesady = Day.new({ "name" => "Tuesday"})
wednesday = Day.new({ "name" => "Wednesday"})
thursday = Day.new({ "name" => "Thursday"})
friday = Day.new({ "name" => "Friday"})
saturday = Day.new({ "name" => "Saturday"})
sunday = Day.new({ "name" => "Sunday"})

monday.save()
tuesady.save()
wednesday.save()
thursday.save()
friday.save()
saturday .save()
sunday.save()


restaurant_1 = Restaurant.new({ "name" => "O'Donals"})
restaurant_2 = Restaurant.new({ "name" => "Burger MacQueen"})

restaurant_1.save()
restaurant_2.save()


burger_1 = Burger.new({
  "name" => "Hambungler",
  "price" => 4.50,
  "restaurant_id" => restaurant_1.id
})

burger_2 = Burger.new({
  "name" => "Cheesibungler",
  "price" => 5,
  "restaurant_id" => restaurant_1.id
})

burger_3 = Burger.new({
  "name" => "Chicken Bungler",
  "price" => 5.50,
  "restaurant_id" => restaurant_1.id
})

burger_4 = Burger.new({
  "name" => "Sir Beefy",
  "price" => 5.20,
  "restaurant_id" => restaurant_2.id
})

burger_5 = Burger.new({
  "name" => "Sir Cheesy",
  "price" => 6,
  "restaurant_id" => restaurant_2.id
})

burger_6 = Burger.new({
  "name" => "Sir Clucksnomore",
  "price" => 6.20,
  "restaurant_id" => restaurant_2.id
  })

burger_1.save()
burger_2.save()
burger_3.save()
burger_4.save()
burger_5.save()
burger_6.save()