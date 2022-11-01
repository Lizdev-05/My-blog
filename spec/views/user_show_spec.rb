require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :system, js:true do
  before(:each) do
    @user = User.create(name: 'Nicholas Emmanuel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a software developer', posts_counter: 4)

    Post.create(author: @user, title: 'ahmed', text: 'anything on unit tests')
    Post.create(author: @user, title: 'hamma', text: 'anything on unit tests')
    Post.create(author: @user, title: 'asim', text: 'anything on unit tests')
    @post = Post.create(author: @user, title: 'doe', text: 'anything on unit not tests')

    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content('Nicholas Emmanuel')
    expect(page).to have_content('I am a software developer')
  end

  it 'should render user profile photo' do
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'should displays static text' do
    expect(page).to have_content('posts')
  end

  it 'Shows the User name' do
    expect(page).to have_content(@user1)
  end

 it 'shows number of user posts' do
    expect(page).to have_content(@user.posts_counter)
  end

  

  it 'it should render the view all user posts link' do
    expect(page).to have_link('See all posts')
  end

  it 'should render three recent posts' do
    expect(page).to have_content(@user.return_recent_posts[0])
    expect(page).to have_content(@user.return_recent_posts[1])
    expect(page).to have_content(@user.return_recent_posts[2])
    expect(page).to have_no_content(Post.where(author: @user))
  end
end