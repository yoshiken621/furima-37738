FactoryBot.define do
  factory :item do
    item_name          {"test"}
    item_detail        {"test"}
    item_category_id   {2}
    item_status_id     {2}
    delivery_fee_id    {2}
    delivery_day_id    {2}
    item_price         {300}
    prefecture_id      {2}
    association        :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/w03_jingu.jpeg'), filename: 'w03_jingu.jpeg')
    end
  end
end
