require File.expand_path(File.dirname(__FILE__) + '/../test/test_helper.rb')

class FactoriesTest <  Minitest::Test

  puts "\n*** Factories Test ***\n\n"

  # name_of_a_factory_to_skip in the exception
  EXCEPTIONS = %w()

  def test_factories

    FactoryGirl.factories.each do |factory|

      next if EXCEPTIONS.include?(factory.name.to_s)

      instance = FactoryGirl.build(factory.name)
      assert instance.valid?, "invalid factory: #{factory.name}, error messages: #{instance.errors.messages.inspect}"

      instance = factory = nil
    end
  end
end
