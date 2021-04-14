class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :user_id, presence: true
  validates :answer_id, presence: true

  def answer
    return Answer.find_by(id:self.answer_id)
  end
  
end
