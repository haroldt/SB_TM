require "test_helper.rb"
require "ask.rb"

class Test_ask < MiniTest::Test
  def test_return_class
    assert_instance_of(Ask, Ask.new())
  end
end
