require 'test_helper'
require 'SB_Events.rb'
include SB_Events

puts "\n*** SB Events Test ***\n\n"

describe SB_Events do
  before do
    @camp = {date: "03/28/15", type:"Camping", amount: 1, location: "Firestone", notes: "Frost Points"}
    @hike = {date: "04/12/15", type:"Hiking", amount: 5, location: "Little Jimmies"}
   # @service = Factory.create  :service
    @hike_event = Hiking.new(@hike)
    @camp_event = Camping.new(@camp)

  end
  it 'creates an camping ' do
    @camp_event.must_be_kind_of Event_base, @camp_event
  end
  it 'creates an hiking ' do
    @hike_event.must_be_kind_of Hiking
  end
  it 'to_a creates an array' do
    @hike_event.to_a.must_be_instance_of Array
  end

  it 'to_a returns correct type'do
    @hike_event.to_a[0][1].must_equal "Hiking"

  end

  it 'Hiking has blank hours, frost_point,nights' do
    @hike_event.hours.must_be_empty
    @hike_event.frost_points.must_be_empty
    @hike_event.nights.must_be_empty
  end

end
