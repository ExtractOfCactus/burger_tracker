require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/restaurant_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/burgers_controller')
require_relative('models/day')

get '/' do
  @weekday = Day.which_day?()
  erb(:index)
end

