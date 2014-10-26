require "bundler"
Bundler.require

require_relative "models/food"
require_relative "models/order"
require_relative "models/party"
require_relative "models/user"
require "./connection"
enable :sessions

# HELPERS #
require_relative "helpers/link_helper"
require_relative "helpers/form_helper"
require_relative "helpers/application_helper"
helpers ActiveSupport::Inflector

get '/' do
	erb :index
end

#USER SIGNUP/LOGIN FORMS

get '/users/signup' do
	erb :"users/signup"
end

post '/users' do
	user = User.new(params[:user])
	user.password = params[:password_hash]
	user.save!
	redirect '/'
end

post '/sessions' do
	redirect '/' unless user = User.find_by({username: params[:username]})
	if user.password == params[:password]
		session[:current_user] = user.id
		redirect '/foods'
	else
		redirect '/'
	end
end

delete '/sessions' do
	session[:current_user] = nil
	redirect '/'
end

# FOODS ROUTES

get '/foods' do
	@foods = Food.all
	erb :"foods/index"
end

get '/foods/new' do
	authenticate!
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
	authenticate!
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

# PARTY ROUTES

get '/parties' do
	@parties = Party.all
	erb :"parties/index"
end

get '/parties/new' do
	authenticate!
	@table_number = params[:table_number]
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
	authenticate!
	@party = Party.find(params[:id])
	erb :"parties/edit"
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])
	if party.payment_status == true
		party.print_receipt
		redirect "/parties/#{party.id}"
	else
		redirect "/parties/#{party.id}"
	end
end

delete '/parties/:id' do
	Party.destroy(params[:id])
	redirect "/parties"
end

# Create Orders

post '/parties/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	order = Order.create(params[:order])
	if order.valid?
		redirect "/parties/#{params[:id]}"
	else
		@errors = order.errors.full_messages
		erb :"parties/show"
	end
end



get '/orders/:id/edit' do
	authenticate!
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



# BINDING PRY
get	'/console' do
	binding.pry
end























#