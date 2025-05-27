# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, "モデルに関するテスト", type: :model do
  describe "バリデーションのテスト" do
    let(:user) { create(:user) }
    let!(:book) { build(:book, user: user) }
    
    context "titleのバリデーションチェック" do
      it "絵本タイトルが空白の場合にバリデーションエラーが返るか" do
        book.title = ''
        expect(book).to be_invalid
        expect(book.errors[:title]).to include("を入力してください")
      end
    end
  end
end
