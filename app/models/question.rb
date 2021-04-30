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
    return Answer.where(question_id:self.id).order(updated_at: :desc).includes(:interests).sort {|a,b| b.interests.count <=> a.interests.count}
  end

  mount_uploader :question_image, ImageUploader
end
