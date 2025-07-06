# frozen_string_literal: true

require 'rails_helper'

describe 'レビュー一覧のテスト', type: :system do
  let(:user) { create(:user) }
  let!(:genre) { create(:genre) }
  let!(:book) { create(:book, user: user, ) }

  context '表示とリンク先の確認' do
    before do 
      sign_in user
      visit users_mypage_path
    end
    it '表示されているかの確認' do
      expect(page).to have_content book.title
      expect(page).to have_link book.title
      expect(page).to have_content("#{genre.id}")
    end
    it 'タイトルの遷移先は詳細画面か' do
      book_link = find_all('a')[1]
      find("a[href='/books/#{book.id}']").click
      expect(current_path).to eq('/books/' + book.id.to_s)
    end
  end
end