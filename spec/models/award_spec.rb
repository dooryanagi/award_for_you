# frozen_string_literal: true

require 'rails_helper'

describe 'Awardモデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:award, award_image: fixture_file_upload('spec/images/rspec_award_image.jpg', 'image/jpg'))).to be_valid
  end
end