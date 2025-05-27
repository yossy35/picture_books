# frozen_string_literal: true

require 'rails_helper'


  describe 'レビュー一覧のテスト', type: :system do
    let(:user) { create(:user) }
    let!(:book) { create(:book, user: user) }

    before do 
      sign_in user
      visit books_path
    end
    context '表示の確認' do
      it '投稿したタイトルと投稿者名が表示されているかの確認' do
        expect(page).to have_content book.user.name
        expect(page).to have_link book.user.name
        expect(page).to have_content book.title
      end
    end
    context 'リンクの遷移先の確認' do
      it '投稿者の遷移先はユーザーの詳細画面か' do
        user_link = find_all('a')[1]
        find("a[href='/users/#{user.id}']").click
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
    end
  end
  
  xdescribe '新規投稿のテスト' do
    before do
      visit new_book_path
    end
    context '表示の確認' do
      it 'new_book_pathが"/books/new"であるか' do
        expect(current_path).to eq('/books/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'book[isbn]', with: Faker::Lorem.characters(number:13)
        image
        fill_in 'book[title]', with: Faker::Lorem.characters(number:10)
        fill_in 'book[author_name]', with: Faker::Lorem.characters(number:6)
        genre
        fill_in 'book[review]', with: Faker::Lorem.characters(number:30)
        output_star
        click_button '投稿'
        expect(page).to have_current_path book_path(book.id)
      end
    end
  end

