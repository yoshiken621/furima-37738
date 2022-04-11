FactoryBot.define do
  factory :purchase_address do
    post_code         { '233-0013' }
    prefecture_id     { 2 }
    city_town         { '横浜市港南区' }
    address           { '丸山台2-41-46' }
    building_name     { '吉野ハイツ' }
    phone_number      { '08047333438' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
