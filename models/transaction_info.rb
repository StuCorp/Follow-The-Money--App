class TransactionInfo

attr_accessor :user_id, :user_name, :transaction_name, :transaction_id, :transaction_cost, :tag_name, :buy_date, :provider_name, :provider_id

def initialize(options)
  @transaction_id = options['transaction_id'].to_i
  @user_id = options['user_id'].to_i
  @user_name = options['user_name']
  @transaction_name = options['transaction_name']
  @transaction_cost = options['transaction_cost'].to_i
  @tag_name = options['tag_name']
  @provider_name = options['provider_name']
  @provider_id = options['provider_id'].to_i
  @buy_date = options['buy_date']
end

def self.full_info
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

# returns the transaction info based on the transaction instance's id
def self.find_id(id)
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date,  transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id WHERE transactions.id = #{id};"
  result = SqlRunner.run(sql).first
  return TransactionInfo.new(result)
end

def self.full_info_by_tag
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY tag_name, buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

def self.full_info_by_provider
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY provider_name, buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end


end