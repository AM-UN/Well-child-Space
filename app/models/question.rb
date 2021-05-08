class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :question_content, presence: true, length:{maximum:400}
  validates :user_id, presence: true

  mount_uploader :question_image, ImageUploader
end
