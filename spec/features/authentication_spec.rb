require 'rails_helper'

RSpec.feature 'SignUp', type: :feature do
  # context 'user inputs valid attributes' do
  #   scenario 'creates a new user' do
  #     visit '/users/new'

  #     # save_and_open_page
  #     fill_in 'Name', with: 'prazwal'
  #     fill_in 'Username', with: 'praz'
  #     click_button 'Create account'

  #     expect(page).to have_text('Welcome to Private Events!')
  #   end
  scenario 'shows the sign up page' do
    visit '/users/new'
    expect(page).to have_content('Sign up')
  end
end

RSpec.feature 'allow signup with vaid attributes', type: :feature do
  before(:each) do
    visit '/users/new'
    fill_in 'Name', with: 'prazwal'
    fill_in 'Username', with: 'praz'
    click_button 'Create account'
  end

  scenario 'redirect to the user page' do
    expect(page).to have_content('Welcome to Private Events!')
  end

  scenario 'display created users profile page' do
    expect(page).to have_content('prazwal')
  end
end

RSpec.feature 'prevent signup with invalid attributes', type: :feature do
  before(:each) do
    visit '/users/new'
    click_button 'Create account'
  end

  scenario 'display the error message' do
    expect(page).to have_content('The form contains 4 errors.')
  end

  scenario 'show the sing up page' do
    expect(page).to have_content('Sign up')
  end
end

RSpec.feature 'Login', type: :feature do
  scenario 'shows the sign up page' do
    visit '/login'
    expect(page).to have_content('Sign in')
  end
end

RSpec.feature 'sign in as a valid user', type: :feature do
  before(:each) do
    @user1 = create(:user)
    visit '/login'
    fill_in 'Username', with: 'praz'
    click_button 'Sign in'
  end

  scenario 'redirect to the user page' do
    expect(page).to have_content('Created Events')
  end
end
