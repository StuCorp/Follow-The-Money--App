require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/user'
require_relative '../models/transaction_info'
require_relative '../models/provider'


get '/providers' do
  @providers = Provider.find_all()
  erb(:"providers/index")
end

get '/providers/new' do
  erb(:"providers/new")
end

post '/providers' do
  @provider = Provider.new(params)
  @provider.save()
  redirect to '/providers'
end

get '/providers/transactions_by_provider' do
  @providers = Provider.find_all()
  @transaction_infos = TransactionInfo.full_info_by_provider_current_month()
  erb(:"providers/transactions_by_provider")
end

get '/providers/:id' do
  @Provider = Provider.find(params[:id])
  erb(:"providers/show")
end

get '/providers/:id/edit' do
  @provider = Provider.find(params[:id])
  erb(:"providers/edit")
end

post '/providers/:id' do
  Provider.new(params).update
  redirect to '/providers'
end

get '/providers/:id/delete' do
  @provider = Provider.find(params[:id])
  @provider.delete
  redirect to "/providers"
end






