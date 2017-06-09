require_relative '../db/sql_runner'

class Tag

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id'] 
    @name = options['name']  
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i  
  end

  def update()
    sql = "UPDATE tags SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = #{@id};"
    SqlRunner.run(sql)  
  end

  def self.find_all
    sql = "SELECT * FROM tags;"
    results = SqlRunner.run(sql)
    return results.map {|result| Tag.new(result)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id};"
    result = SqlRunner.run(sql)[0]
    return Tag.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)  
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = #{id};"
    SqlRunner.run(sql)  
  end


end