require 'test_helper'
require 'TM_Log'

class Test_TM_Log < Minitest::Test
  def setup
    @dir = File.expand_path('../../files',__FILE__)
    @log = TM_Log.new(@dir)
    @events = @log.read
  end
  
  def test_log_path_is_not_empty
    refute_empty(@dir, @dir)
  end
  
  def test_returns_files
    #log =TM_Log.new(@dir)
    #refute_empty(@log, "#{@log.inspect} - #{@dir}")
    assert_instance_of(TM_Log, @log)
  end

  def test_read_returns_array
    assert_instance_of(Array, @events)
  end
  
  def  test_read_returns_array_of_hashes
    assert_instance_of(Hash, @events[0])
  end
  
  def test_read_returned_hash_keys
    assert_equal @events[0].keys, [:last_name, :first_name, :events]
  end
  
 
end