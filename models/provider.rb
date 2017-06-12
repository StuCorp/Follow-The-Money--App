require_relative '../db/sql_runner'

class Provider

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id'] 
    @name = options['name']  
  end

  def save()
    sql = "INSERT INTO providers (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i  
  end

  def update()
    sql = "UPDATE providers SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM providers WHERE id = #{@id};"
    SqlRunner.run(sql)  
  end

  def self.find_all
    sql = "SELECT * FROM providers ORDER BY providers.name ASC;"
    results = SqlRunner.run(sql)
    return results.map {|result| Provider.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM providers WHERE id = #{id};"
    result = SqlRunner.run(sql)[0]
    return Provider.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM providers;"
    SqlRunner.run(sql)  
  end

  def self.delete(id)
    sql = "DELETE FROM providers WHERE id = #{id};"
    SqlRunner.run(sql)  
  end


end