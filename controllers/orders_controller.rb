class OrdersController < ApplicationController

  get '/' do
    @parties = Party.all
    erb :'orders/index'
  end

  get '/:id/edit' do
    authenticate!
    @foods = Food.all
    @order = Order.find(params[:id])
    erb :"orders/edit"
  end

  patch '/:id' do
    order = Order.find(params[:id])
    order.update(params[:order])
    redirect "/parties/#{order.party.id}"
  end

  delete '/:id' do
    order = Order.find(params[:id])
    Order.destroy(params[:id])
    redirect "/parties/#{order.party.id}"
  end

end