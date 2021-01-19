FactoryBot.define do
  factory :item do
    name          { Faker::Name.name}
    exoplanation  {Faker::Lorem.sentence}
    category_id  {2}
    state_id  {2}
    send_fee_id  {2}
    region_id  {2}
    wait_day_id  {2}
    value  {2000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
  end
end
