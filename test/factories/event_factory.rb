Factory.define :event do |f|

    class Event
      attr_accessor :type, :date, :amount, :location, :notes
    end

  #  skip_create

    f.date {(Date.today - Faker::Number.number(3).to_i).strftime("%m/%d/%y")}
    f.amount {Faker::Number.number(1)}
    f.location {Faker::Company.bs}
    f.notes  {Faker::Lorem.sentence}
end
Factory.define :camping, :parent => event  do |f|
      f.type 'camping'
end

Factory.define :hiking, :parent => :event do |f|
      f.type 'hiking'
end

Factory.define :service, :parent => :event  do |f|
      f.type 'service'
end


