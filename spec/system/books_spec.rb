# frozen_string_literal: true

require 'rails_helper'

describe "レビュー一覧のテスト" do
  let!(:book) { create(:book, user.name:'user1', image: File.new("#{Rails.root}/spec/factories/black_book.png"), title:'hoge', author_name:'author1', genre.name:genre.id) }
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
    end
    it 'レビューの遷移先は投稿の詳細画面か' do
      show_link = find_all('a')[1]
      show_link.click
      expect(current_path).to eq('/books/' + book.id)
    end
    it 'コメントの遷移先は画面か' do
      show_link = find_all('a')[1]
      show_link.click
      expect(current_path).to eq('')
    end
  end
end
