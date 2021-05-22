# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it '"応援する"ができるか確認' do
    favorite = build(:favorite)
    expect(favorite).to be_valid
  end
end
