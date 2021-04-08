class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :email, length:{minimum:5, maximum:30}, allow_blank: true

  has_many :questions, dependent: :destroy

  mount_uploader :profile_image, ImageUploader
end
