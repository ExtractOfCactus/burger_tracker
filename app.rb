require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/restaurant_controller')

get '/' do
  erb(:index)
end