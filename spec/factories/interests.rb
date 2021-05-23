# frozen_string_literal: true

FactoryBot.define do
  factory :interest, class: Interest do
    user_id { create(:third_user).id }
    answer_id { create(:answer).id }
  end
end
