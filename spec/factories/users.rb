FactoryBot.define do
  factory :user do
    nickname    { 'test' }
    email       { 'a@a' }
    password    { 'aaa111' }
    password_confirmation { password }
    family_name { '吉野' }
    first_name  { '健太郎' }
    family_name_kana { 'ヨシノ' }
    first_name_kana { 'ケンタロウ' }
    birthday { Faker::Date.birthday }
  end
end
