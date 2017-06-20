require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/restaurant')
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/day')
require_relative('../models/burger_deal')

get '/deals/' do
  @deals = Deal.all()
  erb(:"deals/index")
end

get '/deals/new' do
  @days = Day.all()
  @burgers = Burger.all()
  erb(:"deals/new")
end

post'/deals/' do
  deal = Deal.new(params)
  deal.save()
  params['deal_id'] = deal.id
  burger_deal = BurgerDeal.new(params)
  burger_deal.save()  
  redirect to('/burgers/')
end
