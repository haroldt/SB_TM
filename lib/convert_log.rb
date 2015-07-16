class Convert
  require "SB_Events"
  include SB_Events

  def scout(entity)
    scout = []
    scout << [entity[:first_name],entity[:last_name]]
    event =[]
    entity[:events].map{|x| [scout,retype(x).values].flatten}
  end

  def retype(event)
    #TODO dynamiclay create these from source document and user input
    tm_types =["1 DAY","Bike Ride","Camping", "Eagle Pro", "fund", "Hiking", "Meeting", "Serv Proj", "Training"]
    sb_equiv =["", "", "Camping", "Service", "", "Hiking", "", "Service", ""]
    event.store(:type, sb_equiv[tm_types.index(event.fetch(:type))])
    event
  end

  def create_event(event)
    tm_types =["1 DAY","Bike Ride","Camping", "Eagle Pro", "fund", "Hiking", "Meeting", "Serv Proj", "Training"]
    sb_equiv =["", "", "Camping", "Service", "", "Hiking", "", "Service", ""]
    Object.const_get(sb_equiv[tm_types.index(event[:type])]).new(event)
  end

end
