FactoryBot.define do
  factory :neighbor do
    lot_number { '東1-1-1' }
    name { '佐藤 太郎' }
    address { '東一丁目1番１' }
    address_now { '南一丁目１番１' }
    phone_number { 123 - 1234 - 1234 }
    witness { 1 }
    witness_day { 2020 - 0o1 - 0o1 }
    imprint { 1 }
    imprint_day { 2020 - 0o1 - 0o1 }
    status_id { 1 }
    memo { 'メモメモメモ' }

    association :site
  end
end
