FactoryBot.define do
  factory :user do
    nickname              { Faker::App.name }
    email                 { Faker::Internet.email }
    password              {'aaa000'}
    password_confirmation {password}
    last_name             {'苗字'}
    first_name             {'名前'}
    last_name_kana             {'テスト'}
    first_name_kana             {'テスト'}
    birthday              {'1933-04-02'}
  end
end