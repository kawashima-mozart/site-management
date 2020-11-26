FactoryBot.define do
  factory :marker do
    name {'10'}
    name_cad { '10'}
    exist_id { Faker::Internet.free_email }
    type_id { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
