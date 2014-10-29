class FoodsController < ApplicationController

  get '/' do
    @foods = Food.all
    erb :"foods/index"
  end

  get '/new' do
    authenticate!
    erb :"foods/new"
  end

  post '/' do
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

  get '/:id' do
    @food = Food.find(params[:id])
    erb :"foods/show"
  end

  get '/:id/edit' do
    authenticate!
    @food = Food.find(params[:id])
    erb :"foods/edit"
  end

  patch '/:id' do
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect "/foods/#{food.id}"
    Food.destroy(params[:id])
  end

  delete '/:id' do
    Food.destroy(params[:id])
    redirect "/foods"
  end

end