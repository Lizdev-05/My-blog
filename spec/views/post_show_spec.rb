require 'rails_helper'

RSpec.describe 'Renders the post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Nicholas Emmanuel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a software developer.', posts_counter: 9)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                              author_id: @user.id)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.user, @first_post)
  end

  scenario 'displays the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'disolays number of comments' do
    expect(page).to have_content('Comments: 5')
  end


end