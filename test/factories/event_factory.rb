FactoryGirl.define do
  factory :event do

    class Event
      attr_accessor :type, :date, :amount, :location, :notes
    end

  #  skip_create

    date {(Date.today - Faker::Number.number(3).to_i).strftime("%m/%d/%y")}
    amount {Faker::Number.number(1)}
    location {Faker::Company.bs}
    notes  {Faker::Lorem.sentence}

    trait :camping do
      type 'camping'
    end

    trait :hiking do
      type 'hiking'
    end

    trait :service do
      type 'service'
    end
  end
end
