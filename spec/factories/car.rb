FactoryGirl.define do
  factory :car do
    color "Red"
    year 1985
    mileage 1000

    association :manufacturer
  end
end
