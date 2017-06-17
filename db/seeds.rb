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

monday = Day.new({ "day" => "Monday"})
tuesady = Day.new({ "day" => "Tuesday"})
wednesday = Day.new({ "day" => "Wednesday"})
thursday = Day.new({ "day" => "Thursday"})
friday = Day.new({ "day" => "Friday"})
saturday = Day.new({ "day" => "Saturday"})
sunday = Day.new({ "day" => "Sunday"})

monday.save()
tuesady.save()
wednesday.save()
thursday.save()
friday.save()
saturday .save()
sunday.save()


restaurant_1 = Restaurant.new({ "name" => "Odonals"})
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
  "name" => "Sir Beefy",
  "price" => 5.20,
  "restaurant_id" => restaurant_2.id
})

burger_4 = Burger.new({
  "name" => "Sir Cheesy",
  "price" => 6,
  "restaurant_id" => restaurant_2.id
})

burger_5 = Burger.new({
  "name" => "Sir Clucksnomore",
  "price" => 6.20,
  "restaurant_id" => restaurant_2.id
  })

burger_1.save()
burger_2.save()
burger_3.save()
burger_4.save()
burger_5.save()


deal_1 = Deal.new({
  "title" => "Half price bunglers",
  "price_mod" => 0.5,
  "day_id" => wednesday.id
})

deal_2 = Deal.new({
  "title" => "Royal Thursdays",
  "price_mod" => 0.75,
  "day_id" => thursday.id
})

deal_3 = Deal.new({
  "title" => "Ye olde Wednesdays",
  "price_mod" => 0.5,
  "day_id" => wednesday.id
})

deal_4 = Deal.new({
  "title" => "Molten Mondays",
  "price_mod" => 0.5,
  "day_id" => monday.id
})

deal_1.save()
deal_2.save()
deal_3.save()
deal_4.save()


burger_deal_1 = BurgerDeal.new({
  "deal_id" => deal_1.id,
  "burger_id" => burger_1.id
})

burger_deal_2 = BurgerDeal.new({
  "deal_id" => deal_1.id,
  "burger_id" => burger_2.id
})

burger_deal_3 = BurgerDeal.new({
  "deal_id" => deal_2.id,
  "burger_id" => burger_3.id
})

burger_deal_4 = BurgerDeal.new({
  "deal_id" => deal_2.id,
  "burger_id" => burger_4.id
})

burger_deal_5 = BurgerDeal.new({
  "deal_id" => deal_2.id,
  "burger_id" => burger_5.id
})

burger_deal_6 = BurgerDeal.new({
  "deal_id" => deal_3.id,
  "burger_id" => burger_5.id
})

burger_deal_7 = BurgerDeal.new({
  "deal_id" => deal_4.id,
  "burger_id" => burger_2.id
})

burger_deal_1.save()
burger_deal_2.save()
burger_deal_3.save()
burger_deal_4.save()
burger_deal_5.save()
burger_deal_6.save()
burger_deal_7.save()