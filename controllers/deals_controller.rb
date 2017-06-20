require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/restaurant')
require_relative('../models/burger')
require_relative('../models/deal')
require_relative('../models/day')

get '/deals/' do
  @deals = Deal.all()
  erb(:"deals/index")
end

# get '/restaurants/deals/:id' do

#   erb(:"deals/show")
# end