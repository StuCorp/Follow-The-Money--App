class TransactionInfo

attr_accessor :user_id, :user_name, :transaction_name, :transaction_id, :transaction_cost, :tag_name, :buy_date, :provider_name, :provider_id, :transaction_luxury

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
  @transaction_luxury = options['transaction_luxury']
  # @sql_start = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id"
end



def self.full_info
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

def self.full_info_sort_by(column_name, desc_or_asc)
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY #{column_name} #{desc_or_asc};"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end


# returns the transaction info based on the transaction instance's id
def self.find_id(id)
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id WHERE transactions.id = #{id};"
  result = SqlRunner.run(sql).first
  return TransactionInfo.new(result)
end

def self.full_info_by_tag
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY tag_name, buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

def self.full_info_by_provider
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id ORDER BY provider_name, buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end

def self.format_pennies(number)
  pounds = number/100
  pence = number.to_s
  pennies = pence[-2] + pence[-1]
  return pounds.to_s + "." + pennies
end


def self.format_pounds_pennies(number)
  array = []
  array << number/100
  pence = number.to_s
  pennies = pence[-2] + pence[-1]
  array << pennies.to_i
  return array
  # return pounds.to_s + "." + pennies
  # got to edit and try to put this array as a value in pounds and pence.
end

def self.current_date
  sql = "SELECT CURRENT_DATE;"
  return SqlRunner.run(sql)[0]['date']
end

def self.current_month
  months = ["January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"]
 sql = " select extract(month from current_date);"
  month_num = SqlRunner.run(sql)[0]['date_part'].to_i
  return months[month_num-1]
end

def self.current_year
 sql = "select extract(year from current_date);"
  return SqlRunner.run(sql)[0]['date_part'].to_i
end

def self.start_of_this_month
  sql = "SELECT CURRENT_DATE;"
  current_date= SqlRunner.run(sql)[0]['date']
  current_date[-2]='0'
  current_date[-1]='1'
  return current_date
end

def self.full_info_current_month
  this_month = TransactionInfo.start_of_this_month()
  sql = "SELECT users.id AS user_id, users.name AS user_name, transactions.buy_date AS buy_date, transactions.id AS transaction_id, transactions.name AS transaction_name, transactions.cost AS transaction_cost, tags.name AS tag_name, providers.id AS provider_id, providers.name AS provider_name, transactions.luxury as transaction_luxury FROM users INNER JOIN transactions ON users.id = transactions.user_id INNER JOIN tags ON transactions.tag_id = tags.id INNER JOIN providers ON transactions.provider_id = providers.id  WHERE buy_date BETWEEN '#{this_month}' AND CURRENT_DATE ORDER BY buy_date DESC;"
  results = SqlRunner.run(sql)
  return results.map {|result| TransactionInfo.new(result) }
end



end