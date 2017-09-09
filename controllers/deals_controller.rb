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

#NEW
get '/deals/new' do
  @days = Day.all()
  @burgers = Burger.all()
  erb(:"deals/new")
end

#SHOW
get '/deals/:id' do
  @deal = Deal.find(params['id'].to_i)
  erb(:"deals/show")
end

#CREATE
post '/deals/' do
  deal = Deal.new(params)
  deal.save()
  params['deal_id'] = deal.id
  burger_deal = BurgerDeal.new(params)
  burger_deal.save()  
  redirect to('/burgers/')
end

#EDIT
get '/deals/:id/edit' do
  @deal = Deal.find(params["id"].to_i)
  @days = Day.all()
  @burgers = Burger.all()
  erb(:"deals/edit")
end

#UPDATE
post '/deals/:id' do
  deal = Deal.new(params)
  deal.update()
  params['deal_id'] = deal.id
  burger_deal = BurgerDeal.new(params)
  burger_deal.update() 
  redirect to('/deals/#{params["id"]}')
end

get '/deals/:id/confirm' do
  @deal = Deal.find(params['id'].to_i)
  erb(:"deals/delete")
end

# DELETE
post '/deals/:id/delete' do
  BurgerDeal.delete(params['id'].to_i, 'deal')
  Deal.delete(params['id'].to_i)
  redirect to('/deals/')
end

