# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Post Spec', type: :feature do
  scenario 'Create, Edit and Delete a post.' do
    login_as(FactoryBot.create(:user))
    user2 = FactoryBot.create(:user, email: 'user1@mail.com', username: 'user1')
    visit root_path

    # Create false post
    click_on 'New Post'
    find_field(id: 'post_body_trix_input_post', type: :hidden).set(' ')
    click_on 'Create Post'
    expect(page).to have_content("Body can't be blank")

    # Create post
    click_on 'New Post'
    find_field(id: 'post_body_trix_input_post', type: :hidden).set('This is odinbar!')
    click_on 'Create Post'
    expect(page).to have_content('This is odinbar!')

    # Edit false post
    click_on 'This is odinbar!'
    expect(page).to have_content('This is odinbar!')
    click_on 'Edit'
    find_field(id: 'post_body_trix_input_post_1', type: :hidden).set('  ')
    click_on 'Update Post'
    expect(page).to have_content("Body can't be blank")

    # Edit post
    click_on 'Back to Flow'
    click_on 'This is odinbar!'
    expect(page).to have_content('This is odinbar!')
    click_on 'Edit'
    find_field(id: 'post_body_trix_input_post_1', type: :hidden).set('This post is EDITED!!!')
    click_on 'Update Post'
    expect(page).to have_content('This post is EDITED!!!')

    # Delete post
    click_on 'Back to Flow'
    expect(page).to have_content('This post is EDITED!!!')
    click_on 'This post is EDITED!!!'
    click_on 'Delete'
    expect(page).not_to have_content('This post is EDITED!!!')
  end
end
