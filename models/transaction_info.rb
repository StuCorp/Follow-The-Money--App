class TransactionInfo

attr_accessor :user_id, :user_name, :transaction_name, :transaction_cost, :tag_name

def initialize(options)
  @user_id = options['user_id'].to_i
  @user_name = options['user_name']
  @transaction_name = options['transaction_name']
  @transaction_cost = options['transaction_cost'].to_i
  @tag_name = options['tag_name']
end

def self.full_info
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

def self.full_info_user(id)
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id WHERE user_id = #{id};"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end


end