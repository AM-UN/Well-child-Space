class Question < ApplicationRecord
  belongs_to :user
  
  validates :question_content, presence: true, length:{maximum:400}
  validates :user_id, presence: true

  def user
    return User.find_by(id:self.user_id)
  end

  mount_uploader :question_image, ImageUploader
end
