# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションが機能しているか確認' do
    before do
      @user = build(:user)
    end

    it '全ての値がある場合' do
      expect(@user).to be_valid
    end

    it 'emailが空の場合' do
      @user.email = ''
      @user.valid?
      expect(@user.errors[:email]).to include('を入力してください')
    end

    it 'passwordが空の場合' do
      @user.password = ''
      @user.valid?
      expect(@user.errors[:password]).to include('を入力してください')
    end

    it 'password_confirmationが空の場合' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end

    it 'nameが空の場合' do
      @user.name = ''
      @user.valid?
      expect(@user.errors[:name]).to include('を入力してください')
    end

    it 'self_introductionが空の場合' do
      @user.self_introduction = ''
      @user.valid?
      expect(@user.errors[:self_introduction]).to include('を入力してください')
    end

    it 'emailが重複している場合' do
      @user.save!
      user = build(:user)
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it 'emailのフォーマットが正しくない場合' do
      @user.email = '@gmailcom'
      @user.valid?
      expect(@user.errors[:email]).to include('は不正な値です')
    end

    it 'emailの文字数が30文字より多い場合' do
      @user.email = 'a' * 21 + '@gmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include('は30文字以内で入力してください')
    end

    it 'passwordの文字数が6文字より少ない場合' do
      @user.password = 'a' * 5
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end

    it 'passwordの文字数が20文字より多い場合' do
      @user.password = 'a' * 21
      @user.valid?
      expect(@user.errors[:password]).to include('は20文字以内で入力してください')
    end

    it 'nameの文字数が15文字より多い場合' do
      @user.name = 'a' * 16
      @user.valid?
      expect(@user.errors[:name]).to include('は15文字以内で入力してください')
    end

    it 'self_introductionの文字数が250文字より多い場合' do
      @user.self_introduction = 'a' * 251
      @user.valid?
      expect(@user.errors[:self_introduction]).to include('は250文字以内で入力してください')
    end
  end
end
