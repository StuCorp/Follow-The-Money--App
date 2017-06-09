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

  def save()
    sql = "INSERT INTO transactions (name, cost, user_id, tag_id) VALUES ('#{@name}', #{@cost}, #{@user_id}, #{@tag_id}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i  
  end

  def update()
    sql = "UPDATE transactions SET (name, cost, user_id, tag_id) = ('#{@name}', #{@cost}, #{@user_id}, #{@tag_id}) WHERE id = #{@id};"
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



end