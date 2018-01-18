require ('MiniTest/autorun')
require ('MiniTest/rg')
require_relative '../tag'

class TestTag < Minitest::Test

 def setup()
   @tag1 = Tag.new({"id" => "1", "name"=>"drink"})   
 end

 def test_tag_name()
    assert_equal("drink", @tag1.name)
 end


end