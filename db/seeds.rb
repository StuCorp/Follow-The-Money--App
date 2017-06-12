require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/transaction_info'
require_relative '../models/provider'
require 'pry-byebug' 

User.delete_all()
Tag.delete_all()
Transaction.delete_all()

user1 = User.new({
  'name' => 'Jia Wong',
  'budget' => 50000
  })
user1.save

user2 = User.new({
  'name' => 'Crawfunds Davidson',
  'budget' => 70000
  })
user2.save

tag1 = Tag.new({
  'name' => 'food'
  })
tag1.save

tag2 = Tag.new({
  'name' => 'car'
  })
tag2.save

tag3 = Tag.new({
  'name' => 'toys'
  })
tag3.save

provider1 = Provider.new({
  'name'=> 'amazon.co.uk'
  })
provider1.save 

provider2 = Provider.new({
  'name' => 'Starbucks'
  })
provider2.save

transaction1 = Transaction.new({
  'name' => 'Cheese Burger',
  'cost' => 400, 
  'buy_date' => '2017-06-13',
  'user_id' => user1.id,
  'tag_id' => tag1.id,
  'provider_id'=> provider1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  'name' => 'Petrol',
  'cost' => 3000, 
  'buy_date' => '2017-04-03',
  'user_id' => user2.id,
  'tag_id' => tag2.id,
  'provider_id'=> provider2.id
  })
transaction2.save()

transaction3 = Transaction.new({
  'name' => 'Drone',
  'cost' => 7900, 
  'buy_date' => '2017-03-26',
  'user_id' => user2.id,
  'tag_id' => tag3.id,
  'provider_id'=> provider1.id
  })
  transaction3.save()

  binding.pry
  nil


