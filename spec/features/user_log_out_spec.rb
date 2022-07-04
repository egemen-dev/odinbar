require 'rails_helper'

RSpec.describe 'User Log Out', type: :feature do
  before do
    login_as(FactoryBot.create(:user))
  end
  
  scenario 'by using navbar -log out- button.' do
    visit root_path
    click_on 'Log out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end