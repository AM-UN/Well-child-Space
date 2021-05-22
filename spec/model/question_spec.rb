# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'バリデーションが機能しているか確認' do
    before do
      @question = build(:question)
    end

    it '全ての値がある場合' do
      expect(@question).to be_valid
    end

    it 'question_contentが空の場合' do
      @question.question_content = ''
      @question.valid?
      expect(@question.errors[:question_content]).to include('を入力してください')
    end

    it 'question_contentの文字数が400文字より多い場合' do
      @question.question_content = 'a' * 401
      @question.valid?
      expect(@question.errors[:question_content]).to include('は400文字以内で入力してください')
    end
  end
end
