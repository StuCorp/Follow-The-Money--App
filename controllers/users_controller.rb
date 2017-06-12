require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/user'
require_relative '../models/transaction_info'
require_relative '../models/provider'


get '/users' do
  @users = User.find_all()
  erb(:"users/index")
end

get '/users/new' do
  erb(:"users/new")
end

post '/users' do
  @user = User.new(params)
  @user.budget *= 100
  @user.save()
  redirect to '/users'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb(:"users/show")
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:"users/edit")
end

post '/users/:id' do
  @user = User.new(params)
  @user.budget *= 100
  @user.update()
  # User.new(params).update

  redirect to '/users'
end

get '/users/:id/delete' do
  @user = User.find(params[:id])
  @user.delete
  redirect to "/users"
end




