# frozen_string_literal: true

require 'rails_helper'

describe 'レビュー一覧のテスト', type: :system do
  let(:user) { create(:user) }
  let!(:genre) { create(:genre) }
  let!(:book) { create(:book, user: user, ) }

  context '表示とリンク先の確認' do
    before do 
      sign_in user
      visit books_path
    end
    it '投稿者名とタイトルが表示されているかの確認' do
      expect(page).to have_content book.user.name
      expect(page).to have_link book.user.name
      expect(page).to have_content book.title
    end
    it '投稿者の遷移先はユーザーの詳細画面か' do
      user_link = find_all('a')[1]
      find("a[href='/users/#{user.id}']").click
      expect(current_path).to eq('/users/' + user.id.to_s)
    end
  end

  context '新規投稿のテスト' do
    before do 
      sign_in user
      visit new_book_path
    end
    it '投稿ボタンが表示されているか' do
      expect(page).to have_button '投稿'
    end
    it '投稿後のリダイレクト先は正しいか' do
      fill_in 'book[isbn]', with: Faker::Lorem.characters(number:13)
      fill_in 'book[title]', with: Faker::Lorem.characters(number:10)
      fill_in 'book[author_name]', with: Faker::Lorem.characters(number:6)
      find("#book_genre_ids_#{genre.id}").click
      fill_in 'book[review]', with: Faker::Lorem.characters(number:30)
      click_button '投稿'
      latest_book_id = Book.last.id
      expect(page).to have_current_path book_path(latest_book_id)
    end
  end
end

