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
end
