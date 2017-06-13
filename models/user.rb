require_relative '../db/sql_runner'
require_relative './transaction_info'


class User

  attr_accessor :id, :name, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id'] 
    @name = options['name'] 
    @budget = options['budget'].to_i 
  end

  def save()
    sql = "INSERT INTO users (name, budget) VALUES ('#{@name}', #{@budget}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i  
  end

  def update()
    sql = "UPDATE users SET (name, budget) = ('#{@name}', #{@budget}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM users WHERE id = #{@id};"
    SqlRunner.run(sql)  
  end

  def self.find_all
    sql = "SELECT * FROM users;"
    results = SqlRunner.run(sql)
    return results.map {|result| User.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = #{id};"
    result = SqlRunner.run(sql)[0]
    return User.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)  
  end

  def self.delete(id)
    sql = "DELETE FROM users WHERE id = #{id};"
    SqlRunner.run(sql)  
  end

  def self.budget(budget)
    this_month = TransactionInfo.start_of_this_month()
    sql = "SELECT cost FROM transactions WHERE buy_date BETWEEN '#{this_month}' AND CURRENT_DATE;"
    hash_of_costs = SqlRunner.run(sql)
    total_spend =0
    hash_of_costs.each {|hash| total_spend += hash['cost'].to_i}  
    return budget - total_spend
    
  end

end