require 'rails_helper'

def basic_pass
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}"
end

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # basic_passのメソッドを実行
      basic_pass
      # トップページに移動する
      root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      binding.pry
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      fill_in 'Last_name', with: @user.last_name
      fill_in 'First_name', with: @user.first_name
      fill_in 'Last_name_kana', with: @user.last_name_kana
      fill_in 'First_name_kana', with: @user.first_name_kana
      fill_in 'birthday', with: @user.birthday
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
#   context 'ユーザー新規登録ができないとき' do
#     it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
#       # トップページに移動する
#       # トップページにサインアップページへ遷移するボタンがあることを確認する
#       # 新規登録ページへ移動する
#       # ユーザー情報を入力する
#       # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
#       # 新規登録ページへ戻されることを確認する
#     end
#   end
end
