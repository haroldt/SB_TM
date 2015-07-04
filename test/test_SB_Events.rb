require 'test_helper'
require 'SB_Events.rb'
include Events

puts "\n*** SB Events Test ***\n\n"

describe SB_Events do
  before do
    @camp = {date: "03/28/15", type:"Camping", amount: 1, location: "Firestone", notes: "Frost Points"}
    @hike = {date: "04/12/15", type:"Hiking", amount: 5, location: "Little Jimmies"}
   # @service = Factory.create  :service

  end
  it 'creates an camping ' do
    camp_event = Camping.new(@camp)
    camp_event.must_be_kind_of Event_base, camp_event
  end
  it 'creates an hiking ' do
    hike_event = Hiking.new(@hike)
    hike_event.must_be_kind_of Hiking
  end
end