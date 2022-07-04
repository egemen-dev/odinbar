require 'rails_helper'

RSpec.describe 'Friendship Spec', type: :feature do
  scenario 'logged in user sends friendship requests to a user then cancels the request' do
    login_as(FactoryBot.create(:user))
    FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')

    visit root_path
    click_on 'All Users'
    click_on 'user1'
    click_on 'Send Request'
    expect(page).to have_content('Friendship Request successfully created.')
    click_on 'user1'
    click_on 'Cancel Request'
    expect(page).to have_content('Friendship successfully destroyed.')
  end

  scenario 'a user sends friendship requests to another user and receiver accepts the request' do
    login_as(FactoryBot.create(:user))
    user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'Michael')

    visit root_path
    click_on 'All Users'
    click_on 'Michael'
    click_on 'Send Request'
    expect(page).to have_content('Friendship Request successfully created.')

    visit root_path
    click_on 'Log out'
    expect(page).to have_content('You need to sign in or sign up before continuing.')

    # Switching account to accept the friendship request.
    login_as(user2)
    visit root_path
    click_on 'My profile'
    expect(page).to have_content('Michael')
    click_on 'Received Requests: 1'
    expect(page).to have_content('TesterJoe')
    click_on 'TesterJoe'
    expect(page).to have_content('Decline')
    click_on 'Accept'
    expect(page).to have_content('Friendship successfully accepted.')
  end

  scenario 'logged in (but unauthorized) user tries to display pages and gets redirected' do
    login_as(FactoryBot.create(:user))
    user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
    visit root_path

    # Logged in user tries to access user2's personal friendship management pages.
    visit users_friends_path(user2.id)
    expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendships page.")

    visit users_received_requests_path(user2.id)
    expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendship requests page.")

    visit users_sent_requests_path(user2.id)
    expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendship requests page.")
  end
end