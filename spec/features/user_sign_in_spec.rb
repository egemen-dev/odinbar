require 'rails_helper'

RSpec.describe 'User Sign In', type: :feature do
  before do
    User.create!(username: 'rspec user', email: 'rspectester@mail.com', password: '12345678')
  end

  scenario 'by using the Devise session form.' do
    visit new_user_session_path
    fill_in 'Email', with: 'rspectester@mail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end