require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/restaurant')
require_relative('../models/burger')
require_relative('../models/deal')

get '/restaurants/index' do
  @restaurants = Restaurant.all()
  erb(:"restaurants/index")
end

get '/restaurants/new' do
  erb(:"restaurants/new")
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params["id"].to_i)
erb(:"restaurants/show")
end

post '/restaurants/index' do
  restaurant = Restaurant.new(params)
  restaurant.save()
  redirect to ('/restaurants/index')
end






