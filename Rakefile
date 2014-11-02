require 'bundler'
Bundler.require

require 'sinatra/activerecord/rake'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'restaurant'
  )


namespace :db do

	desc 'create restaurant database'
	task :create_db do
		conn = PG::Connection.open()
		conn.exec('CREATE DATABASE restaurant;')
		conn.close
	end

	desc 'drop restaurant database'
	task :drop_db do
		conn = PG::Connection.open()
		conn.exec('DROP DATABASE restaurant;')
		conn.close
	end

	desc 'create junk data'
	task :junk_data do
		require_relative 'models/food'
		require_relative 'models/party'
		require_relative 'models/order'

		Food.create({name: "Orange Peel Soup", course: "appetizer", price: rand(5..20), spicy: false})
		Food.create({name: "Meat Sandwich", course: "entree", price: rand(5..20), spicy: false})
		Food.create({name: "Sprinkles", course: "dessert", price: rand(5..20), spicy: false})
		Food.create({name: "Cheese Stack", course: "appetizer", price: rand(5..20), spicy: false})
		Food.create({name: "Hottest Soup", course: "appetizer", price: rand(5..20), spicy: true})
		Food.create({name: "Spaghetti Surprise", course: "entree", price: rand(5..20), spicy: false})
		Food.create({name: "Spicy Cereal", course: "entree", price: rand(5..20), spicy: true})
		Food.create({name: "Jelly Beans", course: "dessert", price: rand(5..20), spicy: true})


		8.times {Party.create({last_name: Faker::Name.last_name, table_number: rand(1..10), guests: rand(2..8)})}

		parties = Party.all
		foods = Food.all

		12.times {Order.create({food_id: foods.sample[:id], party_id: parties.sample[:id]})}

	end


end