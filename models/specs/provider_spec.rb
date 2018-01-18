require ('MiniTest/autorun')
require ('MiniTest/rg')
require_relative '../provider'

class TestProvider < Minitest::Test

 def setup()
   @provider1 = Provider.new({"id" => "1", "name"=>"Amazon"})   
 end

 def test_provider_name()
    assert_equal("Amazon", @provider1.name)
 end


end