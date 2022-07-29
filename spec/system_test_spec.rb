require 'rails_helper'

RSpec.describe 'User Actions', type: :system do
  context 'User Actions That Require Turbo' do
    it 'Sign Up, Create Post, Like, Dislike and Comment' do
      visit new_user_registration_path
      fill_in 'Username', with: 'user1'
      fill_in 'Email', with: 'user1@mail.com'
      fill_in 'Password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_on 'Sign up'
      click_on 'my-profile'
      sleep(1)
      expect(page).to have_content('user1')

      click_on 'New Post'
      find("trix-editor").set("TEST POST")
      click_on 'Create Post'
      expect(page).to have_content("TEST POST")
    

      sleep(2)
      # Like post
      click_on 'TEST POST'
      sleep(1)
      click_on 'Like'
      sleep(2)
      expect(page).to have_content('Unlike')

      # Dislike post
      click_on 'Unlike'
      sleep(2)
      expect(page).to have_content('Like')

      # Add a comment
      click_on 'Comment'
      fill_in 'comment_body', with: 'LALALA'
      click_on 'Create Comment'
      expect(page).to have_content('0 likes | 1 comment')
      click_on 'delete'
      expect(page).to have_content('0 likes | 0 comment')
    end
  end
end
