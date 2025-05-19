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
      expect(page).to have_content book.title
      
