# frozen_string_literal: true

FactoryBot.define do
  factory :answer, class: Answer do
    answer_content { '私もあなたと同じような経験があります。' }
    answer_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/default.jpg')) }
    user_id { create(:second_user).id }
    question_id { create(:question).id }
  end
end
