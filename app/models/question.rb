class Question < ApplicationRecord
  belongs_to :user
  
  validates :question_content, presence: true, length:{maximum:400}
  validates :user_id, presence: true

  mount_uploader :question_image, ImageUploader
end
