# frozen_string_literal: true

require 'rails_helper'

describe 'レビュー一覧と新規投稿のテスト' do
  let!(:book) { create(:book, user.name:'user1', image: File.new("#{Rails.root}/spec/factories/black_book.png"), title:'hoge', author_name:'author1', genre.name:genre.id(1), review:'hoge', output_star:, comments.count:) }
  describe 'レビュー一覧のテスト'do
    before do 
      visit books_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているかの確認' do
        expect(page).to have_content user.name
        expect(page).to have_link user.name
        expect(page).to have_selector("img[src$='hoge_image.jpg']")
        expect(page).to have_content title
        expect(page).to have_content author_name
        expect(page).to have_content genre.name
        expect(page).to have_link book.genre
        expect(page).to have_content book.review
        expect(page).to have_link book.review
        # expect(page).to have_ output_star
        expect(page).to have_content book.comments.count
        expect(page).to have_link book.comments.count
      end
    end
    context 'リンクの遷移先の確認' do
      it '投稿者の遷移先はユーザーの詳細画面か' do
        show_link = find_all('a')[1]
        show_link.click
        expect(current_path).to eq('/users/' + user.id)
      end
      it 'ジャンルの遷移先はジャンルの検索結果か' do
        searches_link = find_all('a')[1]
        searches_link.click
        expect(current_path).to eq('/searches/genre_search?genre.id')
      end
      it 'レビューの遷移先は投稿の詳細画面か' do
        show_link = find_all('a')[1]
        show_link.click
        expect(current_path).to eq('/books/' + book.id)
      end
      it 'コメントの遷移先は投稿の詳細画面か' do
        show_link = find_all('a')[1]
        show_link.click
        expect(current_path).to eq('/books/' + book.id)
      end
    end
  end
  describe '新規投稿のテスト' do
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
end
