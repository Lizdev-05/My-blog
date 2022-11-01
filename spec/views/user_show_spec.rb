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

  
end