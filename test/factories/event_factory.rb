FactoryGirl.define do 
  factory :event do
    
    date {(Date.today - Faker::Number.number(3).to_i).strftime("%d/%m/%y")}
    amount {Faker::Number.number(1)}
    location {Faker::Business.bs}
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