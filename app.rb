require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "restaurant"
	)

get '/' do 
	"HELLO WORLD"
end