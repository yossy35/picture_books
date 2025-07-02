# frozen_string_literal: true

require 'rails_helper'

describe 'トップ画面のテスト', type: :system do

  context '表示の確認' do
    before do
      visit root_path
    end
    it 'ボタンが表示される' do
      expect(page).to have_content 'ゲストログイン'
      expect(page).to have_content 'Log in'
      expect(page).to have_content 'Sign up'
    end
    it 'ゲストログインの遷移先が正しいか' do
      find("a[href='/public/guest_sign_in']").click
      expect(current_path).to eq('/users/' + 1.to_s)
    end
    it 'ログインの遷移先が正しいか' do
      find("a[href='/users/sign_in'].btn").click
      expect(current_path).to eq('/users/sign_in')
    end 
    it 'サインアップの遷移先が正しいか' do
      find("a[href='/users/sign_up'].btn").click
      expect(current_path).to eq('/users/sign_up')
    end
  end
end