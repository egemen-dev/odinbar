require 'rails_helper'

RSpec.describe 'Post Spec', type: :feature do
  scenario 'Create, Edit, Like, Dislike and Delete a post.' do
    login_as(FactoryBot.create(:user))
    user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
    visit root_path

    # Create false post
    click_on 'New Post'
    fill_in 'post_body', with: ''
    click_on 'Create Post'
    expect(page).to have_content("Body can't be blank")

    # Create post
    click_on 'New Post'
    fill_in 'post_body', with: 'This is odinbar!'
    click_on 'Create Post'
    expect(page).to have_content('This is odinbar!')

    # Edit false post
    click_on 'This is odinbar!'
    expect(page).to have_content('This is odinbar!')
    click_on 'Edit Post'
    fill_in 'post_body', with: ''
    click_on 'Update Post'
    expect(page).to have_content("Body can't be blank")

    # Edit post
    click_on 'Flow'
    click_on 'This is odinbar!'
    expect(page).to have_content('This is odinbar!')
    click_on 'Edit Post'
    fill_in 'post_body', with: 'This post is EDITED!!!'
    click_on 'Update Post'
    expect(page).to have_content('This post is EDITED!!!')

    # Like post
    click_on 'This post is EDITED!!!'
    click_on 'Like'
    expect(page).to have_content('Like (1)')

    # Dislike post
    click_on 'This post is EDITED!!!'
    click_on 'Like (1)'
    expect(page).to have_content('Like (0)')

    # Delete post
    click_on 'Flow'
    expect(page).to have_content('This post is EDITED!!!')
    click_on 'This post is EDITED!!!'
    click_on 'Delete'
    expect(page).not_to have_content('This post is EDITED!!!')
  end
end