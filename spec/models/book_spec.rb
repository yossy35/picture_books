# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it '有効な投稿は保存されるか' do
    expect(FactoryBot.build(:book)).to be_valid
  end
end