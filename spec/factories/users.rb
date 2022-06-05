FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    password_confirmation {password}
    last_name             {'test'}
    first_name             {'test'}
    last_name_kana             {'テスト'}
    first_name_kana             {'テスト'}
    birthday              {'1933-04-02'}
  end
end