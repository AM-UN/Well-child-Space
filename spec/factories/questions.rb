# frozen_string_literal: true

FactoryBot.define do
  factory :question, class: Question do
    question_content { '相談したいことがあります。' }
    question_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default.jpg')) }
    user_id { create(:user).id }
  end
end
