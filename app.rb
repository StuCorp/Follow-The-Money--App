require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controllers/tags_controller'
require_relative 'controllers/transactions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/providers_controller'

get '/' do
  redirect to '/transactions'
end