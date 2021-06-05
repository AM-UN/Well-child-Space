# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interest, type: :model do
  it '"ためになった"ができるか確認' do
    interest = build(:interest)
    expect(interest).to be_valid
  end
end
