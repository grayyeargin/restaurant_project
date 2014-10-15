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
	food = params[:food]
	food[:name] = food[:name].capitalize
	food = Food.create(params[:food])
	if food.valid?
		redirect "/foods"
	else
		@errors = food.errors.full_messages
		erb :"foods/new"
	end
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
	Food.destroy(params[:id])
end

delete '/foods/:id' do 
	Food.destroy(params[:id])
	redirect "/foods"
end

# Routes for parties

get '/parties' do 
	@parties = Party.all
	erb :"parties/index"
end

get '/parties/new' do 
	erb :"parties/new"
end

post '/parties' do 
	Party.create(params[:party])
	redirect "/parties"

end

get '/parties/:id' do 
	@party = Party.find(params[:id])
	@foods = Food.all
	erb :"parties/show"
end

get '/parties/:id/edit' do 
	@party = Party.find(params[:id])
	erb :"parties/edit"
end

patch '/parties/:id' do 
	party = Party.find(params[:id])
	party.update(params[:party])
	redirect "/parties/#{party.id}"
end

delete '/parties/:id' do
	Party.destroy(params[:id]) 
	redirect "/parties"
end

# Create Orders

post '/parties/:id' do  
	Order.create(params[:order])
	redirect "/parties/#{params[:id]}"
end



get '/orders/:id/edit' do
	@foods = Food.all
	@order = Order.find(params[:id])
	erb :"orders/edit"
end



patch '/orders/:id' do 
	order = Order.find(params[:id])
	order.update(params[:order])
	redirect "/parties/#{order.party.id}"
end

delete '/orders/:id' do 
	order = Order.find(params[:id])
	Order.destroy(params[:id])
	redirect "/parties/#{order.party.id}"
end

get '/parties/:id/receipt' do
	@party = Party.find(params[:id])
	erb :"parties/receipt"
end

patch '/parties/:id/checkout' do \
end

























#