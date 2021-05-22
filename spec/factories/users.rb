# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { 'WellchildSpace@gmail.com' }
    password {'password'}
    password_confirmation {'password'}
    name {'ひまり'}
    profile_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images//default.jpg')) }
    self_introduction {'よろしくお願いします。'}
  end
end
