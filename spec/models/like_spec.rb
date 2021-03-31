require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:tweet) }
  end

  describe 'validation' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
  end
end
