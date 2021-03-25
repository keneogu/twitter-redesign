require 'rails_helper'

RSpec.feature 'Users' do

  before(:each) do
    @user = User.create(fullname: 'kene ogu', username: 'kene')
    visit new_session_path
    fill_in 'Username', with: 'kene'
    click_button 'Login'
  end
  
  scenario 'should enter valid name and login' do
   visit new_session_path
    fill_in :username, with: 'John'
    click_on 'Login'
  end

  scenario 'should visit the index page and view his name' do
    visit tweets_path
    expect(page).to have_content 'kene'
  end
  
end