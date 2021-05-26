# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answer', type: :system do
  before do
    @user = build(:second_user)
    @answer = create(:answer)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
  end

  describe '回答の新規投稿ができるか確認' do
    it '回答投稿ページ(質問詳細ページ)に遷移ができるか確認' do
      visit question_path(@answer.question)
      expect(current_path).to eq question_path(@answer.question)
    end

    describe '回答投稿ページで回答の新規投稿ができるか確認' do
      before do
        visit question_path(@answer.question)
      end

      context '値が入力されている場合' do
        it '回答の新規投稿に成功' do
          fill_in '回答する', with: '私もあなたと同じような経験があります。'
          click_button '回答'
          expect(page).to have_content '回答が追加されました'
          expect(current_path).to eq question_path(@answer.question)
          expect(page).to have_content '私もあなたと同じような経験があります。'
        end
      end

      context '値が入力されてない場合' do
        it '回答の新規投稿に失敗' do
          fill_in '回答する', with: ''
          click_button '回答'
          expect(page).to have_content '回答内容を入力してください'
          expect(current_path).to eq question_path(@answer.question)
        end
      end
    end
  end

  describe '回答の編集ができるか確認' do
    it '回答編集ページに遷移ができるか確認' do
      visit edit_answer_path(@answer)
      expect(current_path).to eq edit_answer_path(@answer)
    end

    describe '回答編集ページで回答の編集ができるか確認' do
      before do
        visit edit_answer_path(@answer)
      end

      context '値が入力されている場合' do
        it '回答の編集に成功' do
          fill_in '回答内容', with: 'それは非常に大変でしたね。'
          click_button '編集を完了する'
          expect(page).to have_content '回答が編集されました'
          expect(current_path).to eq question_path(@answer.question)
          expect(page).to have_content 'それは非常に大変でしたね。'
        end
      end

      context '値が入力されてない場合' do
        it '回答の編集に失敗' do
          fill_in '回答内容', with: ''
          click_button '編集を完了する'
          expect(page).to have_content '回答内容を入力してください'
          expect(current_path).to eq "/answers/#{@answer.id}"
        end
      end
    end
  end

  describe '回答の削除ができるか確認' do
    it 'ユーザー詳細ページで回答の削除リンクが表示される' do
      visit question_path(@answer.question)
      expect(page).to have_content '削除する'
    end

    it '回答の削除リンクをクリックして、回答が削除されるか確認' do
      visit question_path(@answer.question)
      within '.answer-edit-and-delete' do
        click_link '削除する'
      end
      expect(current_path).to eq question_path(@answer.question)
      expect(page).to have_content '回答が削除されました'
      expect(page).not_to have_content @answer.answer_content
    end
  end
end
