require 'minitest/autorun'
require "minitest/spec"
require 'minitest/mock'
require 'minitest/reporters'
require 'active_support'
require 'factory_girl'
require 'faker'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class Minitest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end
