class UsersController < ApplicationController
  # Sign up page
  get '/signup' do
    erb :"users/signup"
  end
  # Create new user
  post '/' do
    user = User.new(params[:user])
    user.password = params[:password_hash]
    user.save!
    redirect '/'
  end

end