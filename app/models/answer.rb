# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :interests, dependent: :destroy

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_content, presence: true, length: { maximum: 800 }

  mount_uploader :answer_image, ImageUploader
end
