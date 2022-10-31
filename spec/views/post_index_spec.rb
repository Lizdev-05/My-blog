require 'rails_helper'

RSpec.describe 'Render posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'John Carson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am an auditor with 30 years working experience.', post_counter: 0)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', comment_counter: 0, like_counter: 0,
                              author_id: @user.id)
    5.times do |_i|
      Comment.create(text: 'Nice post!!', author_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@first_post.author, @first_post)
  end

  scenario 'displays post text' do
    expect(page).to have_content('This is my first post')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hello')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 5')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end
end