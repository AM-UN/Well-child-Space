# frozen_string_literal: true

FactoryBot.define do
  factory :favorite, class: Favorite do
    user_id { create(:second_user).id }
    question_id { create(:question).id }
  end
end
