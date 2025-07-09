# frozen_string_literal: true

require 'rails_helper'

describe 'ゲストログインのマイページのテスト', type: :system do

  context '表示の確認' do
    before do
      visit root_path
    end
    it 'ユーザー名の確認' do
      find("a[href='/public/guest_sign_in']").click
      expect(current_path).to eq('/users/' + 1.to_s)
      expect(page).to have_content 'guestuser'
    end
  end
end