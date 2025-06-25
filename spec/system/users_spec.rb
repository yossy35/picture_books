# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザー一覧のテスト', type: :system do
  let(:user) { create(:user) }
  # let!(:book) { create(:book, user: user, ) }

  context '表示とリンク先の確認' do
    before do 
      sign_in user
      visit users_path
    end
    it '投稿者名と自己紹介文が表示されているかの確認' do
      expect(page).to have_content user.name
      expect(page).to have_link user.name
      expect(page).to have_content user.introduction
    end
  end
end