# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :interests, dependent: :destroy

  validates :email, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }, allow_blank: true
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }, allow_blank: true
  validates :name, presence: true, length: { maximum: 15 }
  validates :self_introduction, presence: true, length: { maximum: 250 }

  mount_uploader :profile_image, ImageUploader
end
