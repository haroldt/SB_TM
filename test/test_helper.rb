require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/reporters'
require 'Factory_Girl'
require 'faker'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class Minitest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end