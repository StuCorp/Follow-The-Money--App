require 'pg'

class SqlRunner
  
  def self.run(sql)
    db = PG.connect({
      dbname: 'follow_the_money',
      host: 'localhost'
      })
    result = db.exec(sql)
    db.close()
    return result
  end
end
