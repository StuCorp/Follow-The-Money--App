require_relative '../db/sql_runner'

class Transaction 

  attr_accessor :id, :name, :cost, :user_id, :tag_id, :buy_date, :provider_id, :luxury

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cost = options['cost'].to_i if options['cost']
    @user_id = options['user_id'].to_i
    @tag_id = options['tag_id'].to_i
    @provider_id = options['provider_id'].to_i
    @buy_date = options['buy_date']
    @luxury = options['luxury']
  end 

  def save()
    sql = "INSERT INTO transactions (name, cost, user_id, tag_id, provider_id, buy_date, luxury) VALUES ('#{@name}', #{@cost}, #{@user_id}, #{@tag_id}, #{@provider_id}, '#{@buy_date}', '#{@luxury}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i  
  end

  def update()
    sql = "UPDATE transactions SET (name, cost, user_id, tag_id, provider_id, buy_date, luxury) = ('#{@name}', #{@cost}, #{@user_id}, #{@tag_id}, #{@provider_id}, '#{@buy_date}', '#{@luxury}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_params(params)
    @name = params['name']
    @cost = (params['cost_pound'].to_i*100) + params['cost_pence'].to_i
    @user_id = params['user_id'].to_i
    @tag_id = params['tag_id'].to_i
    @provider_id = params['provider_id'].to_i
    @buy_date = params['buy_date']
    @luxury = params['luxury']
    sql = "UPDATE transactions SET (name, cost, user_id, tag_id, provider_id, buy_date, luxury) = ('#{@name}', #{@cost}, #{@user_id}, #{@tag_id}, #{@provider_id}, '#{@buy_date}', '#{@luxury}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = #{@id};"
    SqlRunner.run(sql)  
  end

  def self.find_all
    sql = "SELECT * FROM transactions;"
    results = SqlRunner.run(sql)
    return results.map {|result| Transaction.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    result = SqlRunner.run(sql)[0]
    return Transaction.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)  
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id};"
    SqlRunner.run(sql)  
  end

  def self.full_info
    sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date as buy_date, providers.name AS provider_name, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, transactions.luxury AS transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id;"
    results = SqlRunner.run(sql)
    return results.map {|result| TransactionInfo.new(result)}
  end

  def get_user()
    sql = "SELECT users.name FROM users WHERE id = #{@user_id};"
    return SqlRunner.run(sql).first['name']
  end



end