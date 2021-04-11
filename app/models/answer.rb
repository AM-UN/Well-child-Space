class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_content, presence: true, length:{maximum:800}

  def user
    return User.find_by(id:self.user_id)
  end

  def question
    return Question.find_by(id:self.question_id)
  end

  mount_uploader :answer_image, ImageUploader
end
