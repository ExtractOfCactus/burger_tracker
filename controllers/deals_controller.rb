require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/restaurant')
require_relative('../models/burger')
require_relative('../models/deal')

get 'deals/index' do
  @deals = Deal.all()
  erb(:"deals/index")
end