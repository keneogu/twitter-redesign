require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it 'is invalid without a text' do
    tweet = Tweet.create(text: '')
    expect(tweet).not_to be_valid
  end

  describe 'association' do
    it { is_expected.to belong_to(:author).class_name('User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }

    it { is_expected.to validate_length_of(:text).is_at_most(255) }
  end
end
