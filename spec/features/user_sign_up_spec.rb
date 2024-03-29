# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Sign Up', type: :feature do
  scenario 'by using the Devise registration form.' do
    visit new_user_registration_path
    fill_in 'Username', with: 'user1'
    fill_in 'Email', with: 'user1@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_on 'Sign up'

    # Gets redirected to flow page
    expect(page).to have_content('Flow')
  end
end
