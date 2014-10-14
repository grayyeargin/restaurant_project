require "bundler"
Bundler.require

require_relative "models/food"
require_relative "models/order"
require_relative "models/party"

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "restaurant"
	)


# Routes for foods

get '/' do 
	redirect "/foods"
end

get '/foods' do 
	@foods = Food.all
	erb :"foods/index"

end

get '/foods/new' do
	erb :"foods/new"

end

post '/foods' do 
	food = Food.create(params[:food])
	redirect "/foods"

end

get '/foods/:id' do 
	@food = Food.find(params[:id])
	erb :"foods/show"

end 

get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :"foods/edit"

end

patch '/foods/:id' do 
	food = Food.find(params[:id])
	food.update(params[:food])
	redirect "/foods/#{food.id}"
end

delete '/foods/:id' do 
	Food.destroy(params[:id])
	redirect "/foods"

end

# Routes for parties

get '/parties' do 

	erb :"parties/index"
end

get '/parties/new' do 

	erb :"parties/new"
end

post '/parties' do 

end

get '/parties/:id' do 

	erb :"parties/show"
end

get '/parties/:id/edit' do 

	erb :"parties/edit"
end

patch '/parties/:id' do 

end

delete '/parties/:id' do 

end

# Create Orders
post '/orders' do 

	erb :"orders/index"
end

patch '/orders/:id' do 

end

delete '/orders' do 

end

get '/parties/:id/receipt' do

	erb :"parties/receipt"
end

patch '/parties/:id/checkout' do 

end

























#