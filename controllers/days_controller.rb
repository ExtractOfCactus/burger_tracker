require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/day')

get '/days/' do
  @days = Day.all()
  erb(:"days/index")
end