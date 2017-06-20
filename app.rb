require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/restaurant_controller')
require_relative('controllers/deals_controller')

get '/' do
  erb(:index)
end