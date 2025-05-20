# frozen_string_literal: true

require 'rails_helper'

describe "レビュー一覧のテスト" do
  before do 
    visit books_path
  end
  context '表示の確認' do
    it '投稿されたものが表示されているかの確認' do
      expect(page).to have_content book.user.name
      expect(page).to have_link book.user.name
      # expect(page).to have_ book.image
      expect(page).to have_content book.title
      expect(page).to have_content book.author_name
      expect(page).to have_content book.genre
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
end
