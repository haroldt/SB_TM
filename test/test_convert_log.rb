require 'test_helper'
require "convert_log"
require "TM_Log"
require "SB_Events"


class Test_convert_exits < Minitest::Test

  @@activity = YAML.load_file('fixtures/activity.yml')
  @@scouts   = YAML.load_file('fixtures/scouts.yml')

  def setup
    @convert = Convert.new
    @first_activity = @@activity[0]
    @first_scout = @@scouts[0]
    @empty_scout = @@scouts.select{|x| x[:events].empty?}.first
    @scout_one_event = @@scouts.select{|x| x[:events].size == 1}.first
    @scout_two_event = @@scouts.select{|x| x[:events].size == 2}.first
  end


  def test_convert_created
        assert_instance_of Convert, @convert
  end

  def test_empty_scout
        assert_empty @convert.scout(@empty_scout)
  end
  
  def  test_scout_return_a_hash
    assert_kind_of Hash, @convert.scout(@scout_one_event)[0]
  end

  def test_one_event
        assert_equal 1, @convert.scout(@scout_one_event).size
  end

  def test_returns_blank_event_type_for_for_unkown_type
    event={date: "07/13/12", type: "fund", amount: "1", location:"school", notes: "fundraiser" }
        assert_equal "", @convert.retype(event)[:type]
  end

  def test_must_converts_eagle_to_service
    event = {date: "07/13/12", type: "Eagle Pro", amount: "1", location:"school", notes: "Eagle Pro" }
        assert_equal "Service", @convert.retype(event)[:type]
  end

  def test_must_return_two_events
    scouts = @convert.scout(@scout_two_event)
    assert_equal 2, scouts.size, scouts
  end

  def test_creates_camping
    event = {:date=>"03/28/15", :type=>"Camping", :amount=>"1", :location=>"Firestone SRV - Joint Act", :notes=>""}
        new_event = @convert.create_event(event)
    assert_instance_of Camping, new_event ,"class #{new_event.class}"
  end

end
