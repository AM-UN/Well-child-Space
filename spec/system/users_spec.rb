# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :system do
  before do
    @user = create(:user)
  end
  describe 'ユーザーの新規登録ができるか確認' do
    before do
      visit new_user_registration_path
    end

    context '全ての値が入力されている場合' do
      it 'ユーザー新規登録に成功' do
        fill_in 'メールアドレス', with: 'Well-child-Space@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード(確認用)', with: 'password'
        click_button '新規登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context '値が入力されてない場合' do
      it 'ユーザー新規登録に失敗' do
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        fill_in 'パスワード(確認用)', with: ''
        click_button '新規登録'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end
  end

  describe 'ユーザーのログインができるか確認' do
    before do
      visit new_user_session_path
    end

    context '全ての値が入力されている場合' do
      it 'ログインに成功' do
        fill_in 'メールアドレス', with: @user.email
        fill_in 'パスワード', with: @user.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end

    context '値が入力されてない場合' do
      it 'ログインに失敗' do
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'ログイン後にユーザー編集、パスワード変更ができるか確認' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
    end

    it 'ログイン後、"プロフィール"リンクが表示される' do
      expect(page).to have_content('プロフィール')
    end

    it 'ログイン後、"ログアウト"リンクが表示される' do
      expect(page).to have_content('ログアウト')
    end

    it 'ユーザー詳細ページでユーザー編集、パスワード変更ページへのリンクが表示される' do
      visit user_path(@user)
      expect(page).to have_content('ユーザーを編集')
      expect(page).to have_content('パスワードの変更')
    end

    it 'ユーザー編集ページに遷移ができるか確認' do
      visit edit_user_path(@user)
      expect(current_path).to eq edit_user_path(@user)
    end

    it 'パスワード編集ページに遷移ができるか確認' do
      visit edit_password_path
      expect(current_path).to eq edit_password_path
    end

    describe 'ユーザー編集ページで編集ができるか確認' do
      before do
        visit edit_user_path(@user)
      end

      context '全ての値が入力されている場合' do
        it 'ユーザー編集に成功' do
          fill_in 'ユーザー名(15文字以内)', with: 'りん'
          click_button '編集を完了する'
          expect(page).to have_content 'プロフィールが編集されました'
          expect(current_path).to eq user_path(@user)
          expect(page).to have_content 'りん'
        end
      end

      context '値が入力されてない場合' do
        it 'ユーザー編集に失敗' do
          fill_in 'ユーザー名(15文字以内)', with: ''
          click_button '編集を完了する'
          expect(page).to have_content '名前を入力してください'
          expect(current_path).to eq user_path(@user)
        end
      end
    end

    describe 'パスワード編集ページで編集ができるか確認' do
      before do
        visit edit_password_path
      end

      context '全ての値が入力されている場合' do
        it 'パスワード編集に成功' do
          fill_in '現在のパスワード', with: @user.password
          fill_in '新しいパスワード', with: 'wellchildspace'
          fill_in '新しいパスワード(確認用)', with: 'wellchildspace'
          click_button '編集完了'
          expect(page).to have_content 'アカウント情報を変更しました'
          expect(current_path).to eq user_path(@user)
        end
      end

      context '値が入力されてない場合' do
        it 'パスワード編集に失敗' do
          fill_in '現在のパスワード', with: ''
          fill_in '新しいパスワード', with: 'wellchildspace'
          fill_in '新しいパスワード(確認用)', with: 'wellchildspace'
          click_button '編集完了'
          expect(page).to have_content '現在のパスワードを入力してください'
          expect(current_path).to eq '/users'
        end
      end
    end
  end
end
