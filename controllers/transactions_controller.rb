require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/user'
require_relative '../models/transaction_info'

get '/transactions' do
  @transaction_infos = TransactionInfo.full_info()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.find_all()
  erb(:"transactions/new")
end

post '/transactions' do

end