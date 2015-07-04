require "test_helper.rb"
require "ask.rb"
require "minitest/spec"
require "yaml"
include 

describe Ask do

  before do
    @types     =    ["","Camping","Hiking","Service"]
    @logtypes  =  ["1 DAY","Bike Ride","Camping", "Eagle Pro", "fund", "Hiking", "Meeting", "Serv Proj", "Training"]
    @likes     =    [0,0,1,3,0,2,0,3,0]
    @scouts    =   YAML.load_file("fixtures/scouts.yml")
    @scout     =   @scouts[0]
  end
  puts "*** Ask ***"
  describe 'when it reads an activity report' do
    it 'must create an SB event log' do
    end
   
  end
  
  it 'creates events for scout' do
    sb_scout = convert_tm_scout(@scout)
    
    
  end

end
