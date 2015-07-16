module SB_Events
  class Event_base
      attr_accessor :date, :location, :notes
      attr_reader :days, :nights, :frost_points, :miles, :hours
      def initialize(row)
      @date = row[:date]
      @location = row[:location]
      @notes = row[:notes]
      @hours = ""
      @miles = ""
      @nights = ""
      @days = ""
      @frost_points = ""
      end

      def to_a
        @keys ||= self.keys
        @values ||= self.values
        [@keys, @values].transpose.unshift(["Type","#{self.class.to_s.split("::")[1]}"])
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
end
