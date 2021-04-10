class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates :answer_content, presence: true, length:{maximum:800}

end
