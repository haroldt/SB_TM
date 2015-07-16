#require 'TM_Log.rb'
#require 'SB_Events.rb'
include SB_Events
class Ask
  def initialize

  end
end

  @logtypes     =    ["","Camping","Hiking","Service"]
  @types  =    ["1 DAY","Bike Ride","Camping", "Eagle Pro", "fund", "Hiking", "Meeting", "Serv Proj", "Training"]
  @likes     =    [0,0,1,3,0,2,0,3,0]
  def ask (types, logtypes)
    #build request string
    req_string =  ""
    likes = []
    logtypes.each_with_index do |type, index|
      type = "Undefined" if type.empty?
      req_string << " #{index} - #{type}\,"
    end
    max = logtypes.size
    types
    types.each do |type|
      likes << logtypes[get(type, req_string, max)]
    end
    types
  end


def event_type_sub(types,logtypes)
  likes = ask(types, logtypes)
  types.map{|type| type= likes}
end

def get(type, req_string, max)
  i = max
  while i > max - 1
  puts "For your event type #{type} input #{req_string}"
  i = $stdin.gets.chomp.to_i
  end
  i
end
def create_events(events)
     events.map{|event| Object.const_get(@logtypes[@likes[@types.index(event[:type])]]).new(event)}
end
def convert_tm_scout(scout)


end
