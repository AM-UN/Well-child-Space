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

  factory :second_user, class: User do
    email { 'Well-child-Space@gmail.com' }
    password {'password'}
    password_confirmation {'password'}
    name {'れん'}
    profile_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images//default.jpg')) }
    self_introduction {'よろしくお願いします。'}
  end

  factory :third_user, class: User do
    email { 'Wellchild@gmail.com' }
    password {'password'}
    password_confirmation {'password'}
    name {'つむぎ'}
    profile_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images//default.jpg')) }
    self_introduction {'よろしくお願いします。'}
  end
end
