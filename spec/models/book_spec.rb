# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, "モデルに関するテスト", type: :model do
  describe "バリデーションのテスト" do
    let(:user) { create(:user) }
    let!(:book) { build(:book, user_id: user.id) }

    context "titleのバリデーションチェック" do
      it "絵本タイトルが空白の場合にバリデーションエラーが返るか"
       book.title = ''
       expect(book).to be_invalid
       expect(book.errors[:title]).to include("絵本タイトルを入力してください")
    end
    context "author_nameのバリデーションチェック" do
      it "著者名が空白の場合にバリデーションエラーが返るか"
       book.author_name = ''
       expect(book).to be_invalid
       expect(book.errors[:author_name]).to include("著者名を入力してください")
    end
    context "reviewのバリデーションチェック" do
      it "レビューが空白の場合にバリデーションエラーが返るか"
       book.review = ''
       expect(book).to be_invalid
       expect(book.errors[:review]).to include("レビュー文を入力してください")
    end
    context "starのバリデーションチェック" do
      it "星評価が選択されていない場合にバリデーションエラーが返るか"
       book.star = 'starOff'
       expect(book).to be_invalid
       expect(book.errors[:star]).to include("評価を入力してください")
    end
  end
end
