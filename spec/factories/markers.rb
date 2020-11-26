FactoryBot.define do
  factory :marker do
    name {'10'}
    name_cad { '10'}
    exist_id { 1 }
    type_id { 1 }
    association :site
    after(:build) do |marker|
      marker.images.attach(io: File.open('app/assets/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
