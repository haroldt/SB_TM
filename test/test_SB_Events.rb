require 'test_helper'
require 'SB_Events'

class Test_SB_Events < MiniTest::Test
  def setup
    let (:event) { {date: "03/28/15", type:"Camping", amount: "Firestone", notes: "Frost Points"}}
  end

end