require_relative('../models/burger')


get '/burgers/' do
  @burgers = Burger.all()
  erb(:"burgers/index")
end

get '/burgers/new' do
  @restaurants = Restaurant.all()
erb(:"burgers/new")
end

post '/burgers/' do
  burger = Burger.new(params)
  burger.save()
  redirect to('/burgers/')
end