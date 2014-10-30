class PartiesController < ApplicationController

  get '/' do
    @parties = Party.all
    erb :"parties/index"
  end

  get '/new' do
    authenticate!
    @table_number = params[:table_number]
    erb :"parties/new"
  end

  post '/' do
    Party.create(params[:party])
    redirect "/parties"
  end

  get '/:id' do
    authenticate!
    @party = Party.find(params[:id])
    @foods = Food.all
    erb :"parties/show"
  end

  get '/:id/edit' do
    authenticate!
    @party = Party.find(params[:id])
    erb :"parties/edit"
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(params[:party])
    if party.payment_status == true
      party.print_receipt
      redirect "/parties/#{party.id}"
    else
      redirect "/parties/#{party.id}"
    end
  end

  delete '/:id' do
    Party.destroy(params[:id])
    redirect "/parties"
  end

  # Create Order for Party
  post '/:id' do
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

  # View party's receipt
  get '/:id/receipt' do
    authenticate!
    @party = Party.find(params[:id])
    erb :"parties/receipt"
  end

end