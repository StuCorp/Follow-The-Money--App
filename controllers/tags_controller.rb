require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/user'
require_relative '../models/transaction_info'
require_relative '../models/provider'


get '/tags' do
  @tags = Tag.find_all()
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:"tags/new")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to '/tags'
end

get '/tags/transactions_by_tag' do
  @tags = Tag.find_all()
  @transaction_infos = TransactionInfo.full_info_by_tag()
  erb(:"tags/transactions_by_tag")
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb(:"tags/show")
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

post '/tags/:id' do
  Tag.new(params).update
  redirect to '/tags'
end

get '/tags/:id/delete' do
  @tag = Tag.find(params[:id])
  @tag.delete
  redirect to "/tags"
end






