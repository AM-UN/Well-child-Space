# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'バリデーションが機能しているか確認' do
    before do
      @answer = build(:answer)
    end

    it '全ての値がある場合' do
      expect(@answer).to be_valid
    end

    it 'answer_contentが空の場合' do
      @answer.answer_content = ''
      @answer.valid?
      expect(@answer.errors[:answer_content]).to include('を入力してください')
    end

    it 'answer_contentの文字数が800文字より多い場合' do
      @answer.answer_content = 'a' * 801
      @answer.valid?
      expect(@answer.errors[:answer_content]).to include('は800文字以内で入力してください')
    end
  end
end
