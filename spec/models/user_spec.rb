require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a full name and a username' do
    user = User.new(fullname: 'Kenechukwu Oguagbaka', username: 'kene')
    expect(user).to be_valid
  end
  it 'is invalid without a username' do
    user = User.create(fullname: 'Kenechukwu Oguagbaka', username: '')
    expect(user).not_to be_valid
  end
  describe 'association' do
    it { is_expected.to have_many(:tweets).with_foreign_key(:author_id).dependent(:destroy) }

    it { is_expected.to have_many(:active_relationships).with_foreign_key(:follower_id).dependent(:destroy) }

    it { is_expected.to have_many(:followings).through(:active_relationships) }

    it { is_expected.to have_many(:passive_relationships).with_foreign_key(:followed_id).dependent(:destroy) }

    it { is_expected.to have_many(:followers).through(:passive_relationships) }
  end

  describe 'validations' do

    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_length_of(:username).is_at_most(20) }

    it { is_expected.to validate_presence_of(:fullname) }

    it { is_expected.to validate_length_of(:fullname).is_at_most(100) }
  end

  describe '#follow' do
    it 'follows other user' do
      user = User.create(fullname: 'Kenechukwu Oguagbaka', username: 'kene')
      another_user = User.create(fullname: 'John Doe', username: 'john')
      user.follow(another_user)

      expect(user.followings.map(&:id)).to match_array([another_user.id])
    end
  end

  describe '#unfollow' do
    it 'destroys the following record' do
      user = User.create(fullname: 'Kenechukwu Oguagbaka', username: 'kene')
      another_user = User.create(fullname: 'John Doe', username: 'john')
      user.follow(another_user)
      user.unfollow(another_user)

      expect(user.followings.count).to be_zero
    end
  end
end
