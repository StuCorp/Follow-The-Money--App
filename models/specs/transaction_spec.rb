require ('MiniTest/autorun')
require ('MiniTest/rg')
require_relative '../tag'
require_relative '../user'
require_relative '../provider'
require_relative '../transaction'

class TestTransaction < Minitest::Test

 def setup()
   @tag1 = Tag.new({"id" => 3, "name"=>"drink"}) 
   @provider1 = Provider.new({"id" => 1, "name"=>"Amazon"})  
   @user1 = User.new({"id" => 1, "name"=>"Stevens in Accounting", "budget"=> 20000})
   @transaction1 = Transaction.new({
    "name"=>"hot socks", 
    "cost"=>1000,
    "user_id"=> @user1.id,
    "tag_id"=> @tag1.id,
    "provider_id" => @provider1.id,
    "buy_date" => '2018-01-15', 
    "luxury" => true, 
    })  
 end

 def test_transaction_name()
    assert_equal("hot socks", @transaction1.name)
 end

def test_transaction_cost()
  assert_equal(1000, @transaction1.cost)  
end

def test_transaction_user_id()
  assert_equal(1, @transaction1.user_id)
end 

def test_transaction_tag_id()
  assert_equal(3, @transaction1.tag_id)
end

def test_transaction_provider_id()
  assert_equal(1, @transaction1.provider_id)
end

def test_transaction_buy_date()
  assert_equal('2018-01-15', @transaction1.buy_date)
end

def test_transaction_luxury()
  assert_equal(true, @transaction1.luxury)
end



end