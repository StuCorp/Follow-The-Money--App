require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/user'
require_relative '../models/transaction_info'
require_relative '../models/provider'

get '/transactions' do
  @transaction_infos = TransactionInfo.full_info()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.find_all()
  @users = User.find_all()
  @providers = Provider.find_all()

  erb(:"transactions/new")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.cost = (params['cost_pound'].to_i*100) + params['cost_pence'].to_i
  @transaction.save()
  # @transaction.update
  erb(:"transactions/transaction_made")
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction_info = TransactionInfo.find_id(params[:id])

  erb(:"transactions/show")
end

get '/transactions/:id/edit' do
  @providers = Provider.find_all()
  @transaction = Transaction.find(params[:id])
  @tags = Tag.find_all()
  @users = User.find_all()
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  # @transaction.cost = (params['cost_pound'].to_i*100) + params['cost_pence'].to_i
  @transaction.update_params(params)
  redirect to '/transactions'
end

get '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete
  redirect to "/transactions"
end




