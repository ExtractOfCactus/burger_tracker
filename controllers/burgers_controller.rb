require_relative('../models/burger')


get '/burgers/' do
  @burgers = Burger.all()
  erb(:"burgers/index")
end

get '/burgers/new' do
  @restaurants = Restaurant.all()
  erb(:"burgers/new")
end

get '/burgers/:id' do
  @burger = Burger.find(params['id'].to_i)
  erb(:"burgers/show")
end

post '/burgers/' do
  burger = Burger.new(params)
  burger.save()
  redirect to('/burgers/')
end

get '/burgers/:id/edit' do
  @burger = Burger.find(params['id'].to_i)
  @restaurants = Restaurant.all()
  erb(:"burgers/edit")
end

post '/burgers/:id' do
  burger = Burger.new(params)
  burger.save()
  redirect to('/burgers/')
end

