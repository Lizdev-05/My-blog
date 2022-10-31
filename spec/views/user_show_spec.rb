require 'rails_helper'

RSpec.describe 'renders users Show Page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom Ford', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'I am a fashion designer with 2 decades of experience', post_counter: 0)

    5.times do |i|
      Post.create(author: @user, title: "Post #{i}", text: 'This is my post')
    end
    visit user_path(id: @user.id)
  end

  it 'should display user name and bio' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end

  it 'should render user profile photo' do
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'should displays static text' do
    expect(page).to have_content('Hello')
  end

  it 'Shows the User name' do
    expect(page).to have_content @user1
  end

  it 'shows number of user posts ' do
    expect(page).to have_content('Number of Posts : 0')
  end

  it 'shows post comments' do
    expect(page).to have_content('I am a fashion designer with 2 decades of experience')
  end
end