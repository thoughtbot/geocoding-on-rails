FactoryGirl.define do
  factory :location do
    sequence(:store_number)
    sequence(:name) { |n| "Store #{n}" }

    trait :in_boston do
      street_line_1 '12 Winter St.'
      city 'Boston'
      state 'MA'
      postal_code '02111'
      country_code 'US'
    end

    trait :in_boston_with_coordinates do
      in_boston
      latitude 42.35548199999999
      longitude -71.0608386
    end

    trait :in_san_francisco do
      street_line_1 '36 2nd St.'
      city 'San Francisco'
      state 'CA'
      postal_code '94105'
      country_code 'US'
    end
  end
end
