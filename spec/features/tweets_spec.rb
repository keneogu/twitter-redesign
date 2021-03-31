require 'rails_helper'

RSpec.feature 'Tweet' do
  before(:each) do
    user = User.create(fullname: 'kene ogu', username: 'kene')
    @tweet = Tweet.create(text: 'i love lord of the rings', author_id: user.id)
  end
  scenario 'when a user signs in and posts a tweet' do
    visit '/users/sign_in'
    fill_in 'username', with: 'kene'
    click_on 'Login'
    fill_in 'tweet_text', with: 'i love lord of the rings'
    click_on 'Tweet'
    expect(page).to have_content 'Log out'
  end
end
