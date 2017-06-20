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
  burger_deal = BurgerDeal.new(params['burger_id'], params['id'])
  burger_deal.save()
  erb(:"deals/show")
end



# get 'deals/:id' do

#   erb(:"deals/show")
# end