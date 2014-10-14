require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "restaurant"
	)


# Routes for foods

get '/' do 
	redirect "/foods"
end

get '/foods' do 

end

get '/foods/new' do 

end

post '/foods' do 

end

get '/foods/:id' do 

end 

get '/foods/:id/edit' do

end

patch '/foods/:id' do 

end

delete '/foods/:id' do 

end

# Routes for parties

get '/parties' do 

end

get '/parties/new' do 

end

post '/parties' do 

end

get '/parties/:id' do 

end

get '/parties/:id/edit' do 

end

patch '/parties/:id' do 

end

delete '/parties/:id' do 

end

# Create Orders
post '/orders' do 

end

patch '/orders/:id' do 

end

delete '/orders' do 

end

get '/parties/:id/receipt' do 

end

patch '/parties/:id/checkout' do 

end

























#