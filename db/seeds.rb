require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/transaction_info'
require_relative '../models/provider'
require 'pry-byebug' 

User.delete_all()
Tag.delete_all()
Provider.delete_all()
Transaction.delete_all()

user1 = User.new({
  'name' => 'Stuart Bryce',
  'budget' => 50000
  })
user1.save

user2 = User.new({
  'name' => 'Crawfunds Davidson',
  'budget' => 70000
  })
user2.save

tag1 = Tag.new({
  'name' => 'groceries'
  })
tag1.save

tag2 = Tag.new({
  'name' => 'bills'
  })
tag2.save

tag3 = Tag.new({
  'name' => 'coffee'
  })
tag3.save

tag4 = Tag.new({
  'name' => 'booze'
  })
tag4.save

tag5 = Tag.new({
  'name' => 'music'
  })
tag5.save

tag6 = Tag.new({
  'name' => 'leisure activities'
  })
tag6.save

tag7 = Tag.new({
  'name' => 'clothes'
  })
tag7.save

tag8 = Tag.new({
  'name' => 'gifts'
  })
tag8.save

tag9 = Tag.new({
  'name' => 'toys'
  })
tag9.save


provider1 = Provider.new({
  'name'=> 'amazon.co.uk'
  })
provider1.save 

provider2 = Provider.new({
  'name' => 'Spitfire Espresso'
  })
provider2.save

provider3 = Provider.new({
  'name' => 'Morrisons'
  })
provider3.save

provider4 = Provider.new({
  'name' => 'Scottish Power'
  })
provider4.save

provider5 = Provider.new({
  'name' => 'Virgin'
  })
provider5.save

provider6 = Provider.new({
  'name' => 'Urban Outfitters'
  })
provider6.save

provider7 = Provider.new({
  'name' => 'First Bus'
  })
provider7.save

provider8 = Provider.new({
  'name' => 'Goals Shawlands'
  })
provider8.save

provider9 = Provider.new({
  'name' => 'Cineworld'
  })
provider9.save

transaction0 = Transaction.new({
  'name' => 'cinema for 2',
  'cost' => 2260, 
  'buy_date' => '2017-06-11',
  'user_id' => user1.id,
  'tag_id' => tag6.id,
  'provider_id'=> provider9.id,
  'luxury' => false
  })
transaction0.save()

transaction1 = Transaction.new({
  'name' => 'the shoppin',
  'cost' => 3000, 
  'buy_date' => '2017-06-10',
  'user_id' => user1.id,
  'tag_id' => tag1.id,
  'provider_id'=> provider3.id,
  'luxury' => false
  })
transaction1.save()

transaction2 = Transaction.new({
  'name' => 'americano',
  'cost' => 200, 
  'buy_date' => '2017-06-10',
  'user_id' => user1.id,
  'tag_id' => tag3.id,
  'provider_id'=> provider2.id,
  'luxury' => true
  })
transaction2.save()

transaction3 = Transaction.new({
  'name' => 'leccy bill',
  'cost' => 11300, 
  'buy_date' => '2017-06-09',
  'user_id' => user1.id,
  'tag_id' => tag2.id,
  'provider_id'=> provider4.id,   
  'luxury' => false
  })
  transaction3.save()

transaction4 = Transaction.new({
  'name' => 'phone bill',
  'cost' => 1200, 
  'buy_date' => '2017-06-05',
  'user_id' => user1.id,
  'tag_id' => tag2.id,
  'provider_id'=> provider5.id,   
  'luxury' => false
  })
  transaction4.save()

transaction5 = Transaction.new({
  'name' => 'beers',
  'cost' => 750, 
  'buy_date' => '2017-06-03',
  'user_id' => user1.id,
  'tag_id' => tag4.id,
  'provider_id'=> provider3.id,   
  'luxury' => true
  })
  transaction5.save()

transaction6 = Transaction.new({
  'name' => 'present for caldo',
  'cost' => 2000, 
  'buy_date' => '2017-06-12',
  'user_id' => user1.id,
  'tag_id' => tag8.id,
  'provider_id'=> provider1.id,   
  'luxury' => false
  })
  transaction6.save()

transaction7 = Transaction.new({
  'name' => 'present for mayr',
  'cost' => 4100, 
  'buy_date' => '2017-06-02',
  'user_id' => user1.id,
  'tag_id' => tag8.id,
  'provider_id'=> provider6.id,   
  'luxury' => false
  })
  transaction7.save()

transaction8 = Transaction.new({
  'name' => '4 week bus ticket',
  'cost' => 4400, 
  'buy_date' => '2017-06-12',
  'user_id' => user1.id,
  'tag_id' => tag2.id,
  'provider_id'=> provider7.id,   
  'luxury' => false
  })
  transaction8.save()

transaction9 = Transaction.new({
  'name' => 'fives',
  'cost' => 610, 
  'buy_date' => '2017-06-05',
  'user_id' => user1.id,
  'tag_id' => tag6.id,
  'provider_id'=> provider8.id,   
  'luxury' => false
  })
  transaction9.save()

# MAY

  transaction10 = Transaction.new({
    'name' => 'cinema for 2',
    'cost' => 2260, 
    'buy_date' => '2017-05-21',
    'user_id' => user1.id,
    'tag_id' => tag6.id,
    'provider_id'=> provider9.id,
    'luxury' => false
    })
  transaction10.save()

  transaction11 = Transaction.new({
    'name' => 'the shoppin',
    'cost' => 3000, 
    'buy_date' => '2017-05-30',
    'user_id' => user1.id,
    'tag_id' => tag1.id,
    'provider_id'=> provider3.id,
    'luxury' => false
    })
  transaction11.save()

  transaction12 = Transaction.new({
    'name' => 'americano',
    'cost' => 200, 
    'buy_date' => '2017-05-18',
    'user_id' => user1.id,
    'tag_id' => tag3.id,
    'provider_id'=> provider2.id,
    'luxury' => true
    })
  transaction12.save()

  transaction13 = Transaction.new({
    'name' => 'leccy bill',
    'cost' => 11300, 
    'buy_date' => '2017-05-19',
    'user_id' => user1.id,
    'tag_id' => tag2.id,
    'provider_id'=> provider4.id,   
    'luxury' => false
    })
    transaction13.save()

  transaction14 = Transaction.new({
    'name' => 'phone bill',
    'cost' => 1200, 
    'buy_date' => '2017-05-25',
    'user_id' => user1.id,
    'tag_id' => tag2.id,
    'provider_id'=> provider5.id,   
    'luxury' => false
    })
    transaction14.save()

  transaction15 = Transaction.new({
    'name' => 'beers',
    'cost' => 750, 
    'buy_date' => '2017-05-03',
    'user_id' => user1.id,
    'tag_id' => tag4.id,
    'provider_id'=> provider3.id,   
    'luxury' => true
    })
    transaction15.save()

  transaction16 = Transaction.new({
    'name' => 'present for caldo',
    'cost' => 2000, 
    'buy_date' => '2017-05-12',
    'user_id' => user1.id,
    'tag_id' => tag8.id,
    'provider_id'=> provider1.id,   
    'luxury' => false
    })
    transaction16.save()

  transaction17 = Transaction.new({
    'name' => 'present for mayr',
    'cost' => 4100, 
    'buy_date' => '2017-05-02',
    'user_id' => user1.id,
    'tag_id' => tag8.id,
    'provider_id'=> provider6.id,   
    'luxury' => false
    })
    transaction17.save()

  transaction18 = Transaction.new({
    'name' => '4 week bus ticket',
    'cost' => 4400, 
    'buy_date' => '2017-05-08',
    'user_id' => user1.id,
    'tag_id' => tag2.id,
    'provider_id'=> provider7.id,   
    'luxury' => false
    })
    transaction18.save()

  transaction19 = Transaction.new({
    'name' => 'fives',
    'cost' => 610, 
    'buy_date' => '2017-05-02',
    'user_id' => user1.id,
    'tag_id' => tag6.id,
    'provider_id'=> provider8.id,   
    'luxury' => false
    })
    transaction19.save()


    transaction20 = Transaction.new({
      'name' => 'cinema for 2',
      'cost' => 2260, 
      'buy_date' => '2017-04-01',
      'user_id' => user1.id,
      'tag_id' => tag6.id,
      'provider_id'=> provider9.id,
      'luxury' => false
      })
    transaction20.save()

    transaction21 = Transaction.new({
      'name' => 'the shoppin',
      'cost' => 3000, 
      'buy_date' => '2017-04-07',
      'user_id' => user1.id,
      'tag_id' => tag1.id,
      'provider_id'=> provider3.id,
      'luxury' => false
      })
    transaction21.save()

    transaction22 = Transaction.new({
      'name' => 'americano',
      'cost' => 200, 
      'buy_date' => '2017-04-28',
      'user_id' => user1.id,
      'tag_id' => tag3.id,
      'provider_id'=> provider2.id,
      'luxury' => true
      })
    transaction22.save()

    transaction23 = Transaction.new({
      'name' => 'leccy bill',
      'cost' => 11300, 
      'buy_date' => '2017-04-09',
      'user_id' => user1.id,
      'tag_id' => tag2.id,
      'provider_id'=> provider4.id,   
      'luxury' => false
      })
      transaction23.save()

    transaction24 = Transaction.new({
      'name' => 'phone bill',
      'cost' => 1200, 
      'buy_date' => '2017-04-13',
      'user_id' => user1.id,
      'tag_id' => tag2.id,
      'provider_id'=> provider5.id,   
      'luxury' => false
      })
      transaction24.save()

    transaction25 = Transaction.new({
      'name' => 'beers',
      'cost' => 750, 
      'buy_date' => '2017-04-30',
      'user_id' => user1.id,
      'tag_id' => tag4.id,
      'provider_id'=> provider3.id,   
      'luxury' => true
      })
      transaction25.save()

    transaction26 = Transaction.new({
      'name' => 'present for caldo',
      'cost' => 2000, 
      'buy_date' => '2017-04-25',
      'user_id' => user1.id,
      'tag_id' => tag8.id,
      'provider_id'=> provider1.id,   
      'luxury' => false
      })
      transaction26.save()

    transaction27 = Transaction.new({
      'name' => 'present for mayr',
      'cost' => 4100, 
      'buy_date' => '2017-04-12',
      'user_id' => user1.id,
      'tag_id' => tag8.id,
      'provider_id'=> provider6.id,   
      'luxury' => false
      })
      transaction27.save()

    transaction28 = Transaction.new({
      'name' => '4 week bus ticket',
      'cost' => 4400, 
      'buy_date' => '2017-04-28',
      'user_id' => user1.id,
      'tag_id' => tag2.id,
      'provider_id'=> provider7.id,   
      'luxury' => false
      })
      transaction28.save()

    transaction29 = Transaction.new({
      'name' => 'fives',
      'cost' => 610, 
      'buy_date' => '2017-04-12',
      'user_id' => user1.id,
      'tag_id' => tag6.id,
      'provider_id'=> provider8.id,   
      'luxury' => false
      })
      transaction29.save()


      


  binding.pry
  nil


