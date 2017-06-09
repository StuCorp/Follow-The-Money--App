require_relative '../db/sql_runner'

class Transaction 

  attr_accessor :id, :name, :cost, :user_id, :tag_id

  def initialize(options)
    
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cost = options['cost']
    @user_id = options['user_id'].to_i
    @tag_id = options['tag_id'].to_i
  end 

end