class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true

  def question
    return Question.find_by(id:self.question_id)
  end

end
