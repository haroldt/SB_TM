require 'oga'
require 'csv'

class TM_Log
  TYPE_TITLE = "Type(s):"
  EVENT_FIELDS = %i(date type amount location notes)
  MEMBER_FIELDS = %i(last_name first_name)
  attr_reader :types, :splits

  def initialize(path)
    #extract html file names
    path = path + "/" if path !~ /[\/]$/
    @files = Dir.glob(path + "/*.html")

  end

  def read
    @activities = read_files
    split = @activities.map{|x| x.index(TYPE_TITLE)}
    type_location = split[0].to_i
    @types = @activities[0].slice(type_location+1).split(/\,\s/)
    @splits = split.zip(@activities.map{|x| x.index(@types[0])})
    parse
  end
  
  private

  def read_files
    @files.map do |file|
      handle = File.open(file)
      parser = Oga::HTML::Parser.new(handle)
      doc = parser.parse
      #extract line with a <font> tag
      lines = doc.xpath('//font')
      elements = lines.map{|element| [element.attributes[0], element.text]}
      values = elements.select{|attribute| attribute[0] = 'label'}.map{|value| value[1]}
    end
  end

  def parse
    @logs = []
    @activities.each.with_index do |activity, index|
      names = Hash[*[MEMBER_FIELDS.zip(activity[5].split(/\,\s/))]]
      #extract events list
      loc = @splits[index]
      in_row = activity.slice(loc[0]+9,loc[1]-(loc[0]+9))
      # take 5 item at time
      rows =(1..in_row.size/5).map{|x| Hash[*[EVENT_FIELDS.zip(in_row.shift(5))].flatten]}
      @logs << names.merge({events: rows})
    end
    @logs
  end
  
end
