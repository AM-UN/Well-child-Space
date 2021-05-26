# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Question', type: :system do
  before do
    @user = build(:user)
    @question = create(:question)
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
  end

  describe '相談の新規投稿ができるか確認' do
    it '質問投稿ページに遷移ができるか確認' do
      visit new_question_path
      expect(current_path).to eq new_question_path
    end

    describe '質問投稿ページで相談の新規投稿ができるか確認' do
      before do
        visit new_question_path
      end

      context '値が入力されている場合' do
        it '相談の新規投稿に成功' do
          fill_in '相談内容', with: '相談したいことがあります。'
          click_button '投稿する'
          expect(page).to have_content '相談が追加されました'
          expect(current_path).to eq root_path
          expect(page).to have_content '相談したいことがあります。'
        end
      end

      context '値が入力されてない場合' do
        it '相談の新規投稿に失敗' do
          fill_in '相談内容', with: ''
          click_button '投稿する'
          expect(page).to have_content '相談内容を入力してください'
          expect(current_path).to eq '/questions'
        end
      end
    end
  end

  describe '相談の編集ができるか確認' do
    it '質問編集ページに遷移ができるか確認' do
      visit edit_question_path(@question)
      expect(current_path).to eq edit_question_path(@question)
    end

    describe '質問編集ページで相談の編集ができるか確認' do
      before do
        visit edit_question_path(@question)
      end

      context '値が入力されている場合' do
        it '相談の編集に成功' do
          fill_in '相談内容', with: '皆さんに聞いてみたいことがあります。'
          click_button '編集を完了する'
          expect(page).to have_content '相談が編集されました'
          expect(current_path).to eq root_path
          expect(page).to have_content '皆さんに聞いてみたいことがあります。'
        end
      end

      context '値が入力されてない場合' do
        it '相談の編集に失敗' do
          fill_in '相談内容', with: ''
          click_button '編集を完了する'
          expect(page).to have_content '相談内容を入力してください'
          expect(current_path).to eq "/questions/#{@question.id}"
        end
      end
    end
  end

  describe '相談の削除ができるか確認' do
    it 'ユーザー詳細ページで質問の削除リンクが表示される' do
      visit question_path(@question)
      expect(page).to have_content '削除する'
    end

    it '質問の削除リンクをクリックして、相談が削除されるか確認' do
      visit question_path(@question)
      click_link '削除する'
      expect(current_path).to eq root_path
      expect(page).to have_content '相談が取り消されました'
      expect(page).not_to have_content @question.question_content
    end
  end
end
