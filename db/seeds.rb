require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/transaction'
require 'pry-byebug' 

User.delete_all()
Tag.delete_all()
Transaction.delete_all()

user1 = User.new({
  'name' => 'Jia Wong'
  })
user1.save

user2 = User.new({
  'name' => 'Crawfunds Davidson'
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


transaction1 = Transaction.new({
  'name' => 'Cheese Burger',
  'cost' => 400, 
  'user_id' => user1.id,
  'tag_id' => tag1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  'name' => 'Petrol',
  'cost' => 3000, 
  'user_id' => user2.id,
  'tag_id' => tag2.id
  })
transaction2.save()

transaction3 = Transaction.new({
  'name' => 'Drone',
  'cost' => 7900, 
  'user_id' => user2.id,
  'tag_id' => tag3.id
  })
  transaction3.save()

  binding.pry
  nil


