FactoryBot.define do
  factory :user do
    nickname                {"やじうま"}
    email                   {Faker::Internet.free_email}
    password                {"aaa1111"}
    password_confirmation   { password }
    last_name               {"山田"}
    first_name              {"二郎"}
    last_name_kana          {"ヤマダ"}
    first_name_kana         {"ジロウ"}
    birthday                {'1930-01-01'}
  end
end