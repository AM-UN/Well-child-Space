class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :question_content, presence: true, length:{maximum:400}
  validates :user_id, presence: true

  def user
    return User.find_by(id:self.user_id)
  end

  def answers
    return Answer.where(question_id:self.id)
  end

  mount_uploader :question_image, ImageUploader
end
