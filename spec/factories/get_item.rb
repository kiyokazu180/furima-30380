FactoryBot.define do
  factory :get_item do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"811-1344"}
    region_id     {2}
    city          {"福岡市西区"}
    area          {"三宅3-11-22"}
    phone_number  {11111112222}
    user_id       {1}
    item_id       {1}
  end
end
