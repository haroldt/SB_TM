class SB_Events
  #require 'logger'
  #TODO create a class for conversion matrix
  #TODO move the ask method to that class
  #TODO pass event matrix to SB_Events class

  attr_reader :likes

  def initialize(activities, types)
    @logtypes  =  [ '' ,'Camping' ,'Hiking', 'Service']
    @activities = activities
    @types = types
    @out = []
  end

  def convert_SB
    @activities.each do |scout|
      rows = []
      create_events(scout[:events])
          end


  end
  def create_events(events)
     events.map{|event| Object.const_get(logtypes[likes[types.index(event[:type])]]).new(event)}
  end
  def ask
    #build request string
    req_string = ""
    @likes = []
    @logtypes.each_with_index do |type, index|
      type = "Undefined" if type.empty?
      req_string << " #{index} - #{type}\,"
    end
     i = max = @logtypes.size

    @types.each do |type|
      @likes << logtypes[get(type, req_string, max)]
    end
  end
end

  class Event_base
      attr_accessor :date, :location, :notes
      attr_reader :days, :nights, :frost_points, :miles, :hours
      def initialize(row)
      @date = row[:date]
      @location = row[:location]
      @notes = row[:notes]
      end

      def to_a
        @keys ||= self.keys
        @values ||= self.values
        [@keys, @values].transpose.unshift(["Type","#{self.class}"])
      end

      def keys
        @keys = self.instance_variables.map{|x| x.to_s.delete("@")}

      end

      def values
        @keys ||= self.keys
        @values ||= @keys.map{|key| self.instance_eval("#{key}")}
      end


  end
  class Camping < Event_base
    attr_writer :days, :nights, :frost_points
    def initialize(row)
      super(row)
      @nights = row[:amount].to_i
      @days = @nights + 1
      @frost_points = ""
    end
  end

  class Hiking < Event_base
    attr_writer :days, :nights, :miles
    def initialize(row)
      super(row)
      @miles = row[:amount].to_i
      @days = 1
    end
  end

  class Service < Event_base
    attr_writer :hours
    def initialize(row)
      super(row)
      @hours = row[:amount].to_f
    end
  end
