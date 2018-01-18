require ('MiniTest/autorun')
require ('MiniTest/rg')
require_relative '../user'

class TestUser < Minitest::Test

 def setup()
   @user1 = User.new({"id" => "1", "name"=>"Stevens in Accounting", "budget"=> 20000})   
 end

 def test_tag_name()
    assert_equal("Stevens in Accounting", @user1.name)
 end

def test_budget()
  assert_equal(20000, @user1.budget)
end

def test_id()
  assert_equal(1, @user1.id)
  
end

end