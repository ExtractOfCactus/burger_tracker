require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/restaurant')

get '/restaurants/index' do
  @restaurants = Restaurant.all()
  erb(:"restaurants/index")
end

get '/restaurants/new' do
  erb(:"restaurants/new")
end

post '/restaurants/index' do
  restaurant = Restaurant.new(params)
  restaurant.save()
  redirect to ('/restaurants/index')
end