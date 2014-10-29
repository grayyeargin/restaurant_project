require "bundler"
Bundler.require

Dir.glob("./{helpers,models,controllers}/*.rb").each do |file|
	require file
	puts "required #{file}"
end

map('/orders'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/parties'){ run PartiesController }
map('/foods'){ run FoodsController }
map('/'){ run ApplicationController}