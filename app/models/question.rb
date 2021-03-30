class Question < ApplicationRecord
  validates :question_content, presence: true, length:{maximum:400}
end
