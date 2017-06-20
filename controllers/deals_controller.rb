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

post'/deals/:id' do
  deal = Deal.new(params)#([params['id'], params['title'], params['day_id']])
  deal.save()
  params['deal_id'] = deal.id
  burger_deal = BurgerDeal.new(params)#([params['burger_id'].to_i, params['id'].to_i])
  burger_deal.save()  
  erb(:"deals/show")
end
