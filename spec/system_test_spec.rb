# require 'rails_helper'

# RSpec.describe 'User Actions', type: :system do
#   context 'registration' do
#     it 'signs up successfully using the form and redirects the user' do
#       visit new_user_registration_path
#       fill_in 'Username', with: 'user1'
#       fill_in 'Email', with: 'user1@mail.com'
#       fill_in 'Password', with: '123456'
#       fill_in 'user_password_confirmation', with: '123456'
#       click_on 'Sign up'
#       click_on 'my-profile'
#       expect(page).to have_content('user1')
#     end
#   end

#   context 'login' do
#     it 'signs in successfully using the form' do
#       User.create!(username: 'rspec user', email: 'rspectester@mail.com', password: '12345678')
#       visit new_user_session_path
#       fill_in 'Email', with: 'rspectester@mail.com'
#       fill_in 'Password', with: '12345678'
#       click_on 'Log in'
#       expect(page).to have_selector(:link_or_button, 'my-profile')
#     end
#   end

#   context 'logout' do
#     it 'logs out successfully by clicking the log out button on navbar' do
#       login_as(FactoryBot.create(:user))
#       visit root_path
#       sleep(2)
#       click_on 'log-out'
#       sleep(2)
#       expect(page).to have_content('Your social media')
#     end
#   end

#   context 'sending and cancelling friendship request' do
#     it 'logged in user sends friendship requests to a user then cancels the request' do 
#       login_as(FactoryBot.create(:user))
#       FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
#       visit root_path
#       click_on 'All Users'
#       click_on 'user1'
#       click_on 'Send Request'
#       expect(page).to have_content('Sent Requests')
#       expect(page).to have_content('user1')
#       click_on 'user1'
#       click_on 'Cancel Request'
#       click_on 'Sended Requests'
#       expect(page).not_to have_content('user1')
#     end
#   end

#   context 'forming a valid friendship' do
#     it 'a request gets accepted by the receiver' do
#       login_as(FactoryBot.create(:user))
#       user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'Michael')

#       visit root_path
#       click_on 'All Users'
#       click_on 'Michael'
#       click_on 'Send Request'
#       expect(page).to have_content('Friendship Request successfully created.')

#       visit root_path
#       click_on 'Log out'
#       expect(page).to have_content('You need to sign in or sign up before continuing.')

#       # Switching account to accept the friendship request.
#       login_as(user2)
#       visit root_path
#       click_on 'My profile'
#       expect(page).to have_content('Michael')
#       click_on 'Received Requests: 1'
#       expect(page).to have_content('TesterJoe')
#       click_on 'TesterJoe'
#       expect(page).to have_content('Decline')
#       click_on 'Accept'
#       expect(page).to have_content('Friendship successfully accepted.')
      
#       # Open visit_notifications_path and delete all
#       click_on 'Notifications (1)'
#       click_on 'Delete All'
#       expect(page).to have_content('All the notifications are deleted.')
#     end
#   end

#   context 'user only have access to allowed pages' do
#     it 'logged in (but unauthorized) user tries to display pages and gets redirected' do
#       login_as(FactoryBot.create(:user))
#       user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
#       visit root_path

#       # Logged in user tries to access user2's personal friendship management pages.
#       visit user_friends_path(user2.id)
#       expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendships page.")

#       visit user_received_requests_path(user2.id)
#       expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendship requests page.")

#       visit user_sent_requests_path(user2.id)
#       expect(page).to have_content("You don't have a permission to see #{user2.username}'s friendship requests page.")
#     end
#   end

#   context 'Create - Edit - Delete a post' do
#     it 'user creates a posts, updates and then deletes it' do
#       login_as(FactoryBot.create(:user))
#       user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
#       visit root_path

#       # Create false post
#       # click_on 'New Post'
#       # find('trix-editor').click.set('')
#       # click_on 'Create Post'
#       # sleep(1)
#       # expect(page).to have_content("Body can't be blank")
  
#       # Create post
#       click_on 'New Post'
#       find('trix-editor').click.set('This is odinbar!')
#       click_on 'Create Post'
#       sleep(1)
#       expect(page).to have_content('This is odinbar!')
      
#       # Edit false post
#       click_on 'This is odinbar!'
#       expect(page).to have_content('This is odinbar!')
#       click_on 'Edit Post'
#       find('trix-editor').click.set('  ')
#       sleep(3)
#       click_on 'Update Post'
#       sleep(3)
#       expect(page).to have_content("Body can't be blank")
      
#       # Edit post
#       click_on 'Flow'
#       click_on 'This is odinbar!'
#       expect(page).to have_content('This is odinbar!')
#       click_on 'Edit Post'
#       find('trix-editor').click.set('This post is EDITED!!!')
#       click_on 'Update Post'
#       expect(page).to have_content('This post is EDITED!!!')
  
#       # Like post
#       click_on 'This post is EDITED!!!'
#       click_on 'Like'
#       expect(page).to have_content('Like (1)')
  
#       # Dislike post
#       click_on 'This post is EDITED!!!'
#       click_on 'Like (1)'
#       expect(page).to have_content('Like (0)')
  
#       # Delete post
#       click_on 'Flow'
#       expect(page).to have_content('This post is EDITED!!!')
#       click_on 'This post is EDITED!!!'
#       click_on 'Delete'
#       expect(page).not_to have_content('This post is EDITED!!!')
#     end
#   end
# end
