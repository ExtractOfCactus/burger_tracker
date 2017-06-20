require_relative('../models/burger')


get '/burgers/' do
  @burgers = Burger.all()
  erb(:"burgers/index")
end